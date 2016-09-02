package com.sivitsky.ddr;

import com.sivitsky.ddr.service.UserService;
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

import static junit.framework.Assert.assertEquals;

@ContextConfiguration(locations = {"classpath*:spring/core/*.xml"})
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
public class LoginControllerTest {

    @Autowired
    WebApplicationContext wac;

    @Autowired
    UserService userService;

    private MockMvc mockMvc;

    @Before
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
    }

    @Test
    public void testRegistration() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/registration"))
                .andExpect(MockMvcResultMatchers.view().name("quick_registration"))
                .andExpect(MockMvcResultMatchers.model().attributeExists("user"))
                .andExpect(MockMvcResultMatchers.model().attributeExists("listRolesWithoutAdmin"));
    }

    @Test
    public void testSaveUser() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.post("/registration/save")
                .param("firstname", "firstname")
                .param("lastname", "lastname")
                .param("login", "login")
                .param("password", "password")
                .param("email", "email@email.com")
                .param("phone", "2-2-2")
                .param("role", "ROLE_ADMIN"))
                .andExpect(MockMvcResultMatchers.redirectedUrl("/index"));
        assertEquals("firstname", userService.getUserByEmail("email@email.com").getFirstname());
        userService.removeUser(userService.getUserByEmail("email@email.com"));
    }

}