package com.sivitsky.ddr;

import com.sivitsky.ddr.model.Offer;
import com.sivitsky.ddr.model.User;
import com.sivitsky.ddr.service.OfferService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@ContextConfiguration(locations = {"classpath*:spring/core/*.xml"})
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
public class OfferControllerTest {

    @Autowired
    WebApplicationContext wac;

    @Autowired
    OfferService offerService;

    private MockMvc mockMvc;

    @Before
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
    }

    @Test
    public void testListOffers() throws Exception {
        final User user = new User();
        mockMvc.perform(MockMvcRequestBuilders.get("/offers")
                .sessionAttr("user", user))
                .andExpect(MockMvcResultMatchers.view().name("offer"))
                .andExpect(MockMvcResultMatchers.model().attributeExists("offer"))
                .andExpect(MockMvcResultMatchers.model().attributeExists("listPart"))
                .andExpect(MockMvcResultMatchers.model().attributeExists("listVendor"))
                .andExpect(MockMvcResultMatchers.model().attributeExists("listCurrency"));
    }

    @Test
    public void testDelOffer() throws Exception {
        Offer offer = new Offer();
        offer.setOffer_id(99999l);
        offerService.saveOffer(offer);
        mockMvc.perform(MockMvcRequestBuilders.post("/offers/add").sessionAttr("offer", offer)
                        .param("offer_price", "10.2")
                        .param("currency", "EUR")
        )
                .andExpect(MockMvcResultMatchers.redirectedUrl("/offers"));
    }
}