package com.openwebsys.redrates;

import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/movies")
@Controller
@RooWebScaffold(path = "movies", formBackingObject = Movie.class)
@RooJson
@RooWebJson(jsonObject = Movie.class)
public class MovieController {
}
