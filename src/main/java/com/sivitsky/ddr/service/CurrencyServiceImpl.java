package com.sivitsky.ddr.service;

import com.sivitsky.ddr.model.ListCurrency;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CurrencyServiceImpl implements CurrencyService {

    public List<String> getCurrencies() {
        List<String> listCurrencies = new ArrayList<>();
        listCurrencies.add(ListCurrency.BYR.toString());
        listCurrencies.add(ListCurrency.EUR.toString());
        listCurrencies.add(ListCurrency.RUR.toString());
        listCurrencies.add(ListCurrency.USD.toString());
        return listCurrencies;
    }
}
