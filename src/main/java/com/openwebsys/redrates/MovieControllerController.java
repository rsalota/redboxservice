package com.openwebsys.redrates;

import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebJson(jsonObject = MovieController.class)
@Controller
@RequestMapping("/moviecontrollers")
public class MovieControllerController {
}
