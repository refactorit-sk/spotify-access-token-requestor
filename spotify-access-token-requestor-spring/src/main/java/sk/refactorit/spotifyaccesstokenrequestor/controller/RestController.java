package sk.refactorit.spotifyaccesstokenrequestor.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@org.springframework.web.bind.annotation.RestController
public class RestController {

    private static final Logger log = LoggerFactory.getLogger(RestController.class);

    @GetMapping(value = "/authorize")
    public String authorize(@RequestParam(name = "code", required = false) String code,
                            @RequestParam(name = "state", required = false) String state) {

        log.info("Authorization Code: {}", code);
        log.info("Authorization State : {}", state);
        return "Hello World!";
    }

    @GetMapping("/login")
    public ModelAndView redirectWithUsingRedirectPrefix(ModelMap model) {
        model.addAttribute("attribute", "redirectWithRedirectPrefix");
        return new ModelAndView("redirect:https://accounts.spotify.com/authorize?response_type=code&client_id=7b6122c9aa73442c8eb68af757d068eb&scope=user-read-private user-read-email&redirect_uri=http://refactorit.brazilsouth.cloudapp.azure.com:8090/authorize", model);
    }
}