package com.sivitsky.ddr.dao;

import com.sivitsky.ddr.model.Part;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PartDAOImpl implements PartDAO {

    private static final Logger logger = LoggerFactory.getLogger(PartDAOImpl.class);

    @Autowired
    private SessionFactory sessionFactory;

    public Part savePart(Part part) {
        sessionFactory.getCurrentSession().saveOrUpdate(part);
        logger.info("Part updated successfully, Part id=" + part.getPart_id());
        return part;
    }

    @SuppressWarnings("unchecked")
    public List<Part> listPart() {
        return sessionFactory.getCurrentSession().createQuery("from Part").list();
    }

    @SuppressWarnings("unchecked")
    public List<Object[]> listPartWithDetail(Integer firstResult, Integer maxResult) {
        return sessionFactory.getCurrentSession()
                .getNamedQuery("Part.findAllWithDetail")
                .setFirstResult(firstResult)
                .setMaxResults(maxResult)
                .list();
    }

    @SuppressWarnings("unchecked")
    public List<Part> listPartWithManufactursFilter(Long[] mas_id) {
        return sessionFactory.getCurrentSession()
                .getNamedQuery("Part.findByManufactId")
                .setParameterList("mas_id", mas_id).list();
    }

    @SuppressWarnings("unchecked")
    public List<Part> listPartByManufactIdAndPrice(Long[] mas_id, Float price_from, Float price_to) {
        if (mas_id.length == 0) {
            String hql = "select MIN (offer.offer_price) as min_price, COUNT (offer.offer_id), part.part_id as part_id, " +
                    "part.part_name as part_name, currency.valuta_name as offer_count from Part part join  part.offers offer join offer.currency currency " +
                    "where (:price_from = 0.0f or offer.offer_price >= :price_from) and (:price_to = 0.0f or offer.offer_price <= :price_to) group by part.part_id";
            return sessionFactory.getCurrentSession().createQuery(hql)
                    .setParameter("price_from", price_from)
                    .setParameter("price_to", price_to).list();
        } else {
            String hql = "select MIN (offer.offer_price) as min_price, COUNT (offer.offer_id), part.part_id as part_id, part.part_name as part_name, " +
                    "currency.valuta_name as offer_count from Part part join  part.offers offer join offer.currency currency " +
                    "where (:price_from = 0.0f or offer.offer_price >= :price_from) and (:price_to = 0.0f or offer.offer_price <= :price_to) and (part.manufactur in (select distinct m from Manufactur m where m.manufactur_id in (:mas_id)))" +
                    " group by part.part_id";
            return sessionFactory.getCurrentSession().createQuery(hql).setParameterList("mas_id", mas_id)
                    .setParameter("price_from", price_from)
                    .setParameter("price_to", price_to).list();
        }
    }

    public Part getPartById(Long id) {
        return (Part) this.sessionFactory.getCurrentSession().get(Part.class, id);
    }

    public Part getPartByName(String name) {
        return (Part) sessionFactory.getCurrentSession().createQuery("select v from Part v where v.part_name = :part_name")
                .setParameter("part_name", name).uniqueResult();
    }

    public void removePart(Long id) {
        Part part = (Part) sessionFactory.getCurrentSession().load(Part.class, id);
        if (null != part) {
            sessionFactory.getCurrentSession().delete(part);
        }
    }

    @SuppressWarnings("unchecked")
    public Integer getCountOfPart() {
        return sessionFactory.getCurrentSession()
                .getNamedQuery("Part.findAllWithDetail")
                .list().size();
    }

}
