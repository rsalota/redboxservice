// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.openwebsys.redrates;

import com.openwebsys.redrates.Movie;
import com.openwebsys.redrates.MovieController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect MovieController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String MovieController.create(@Valid Movie movie, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, movie);
            return "movies/create";
        }
        uiModel.asMap().clear();
        movie.persist();
        return "redirect:/movies/" + encodeUrlPathSegment(movie.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String MovieController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Movie());
        return "movies/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String MovieController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("movie", Movie.findMovie(id));
        uiModel.addAttribute("itemId", id);
        return "movies/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String MovieController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("movies", Movie.findMovieEntries(firstResult, sizeNo));
            float nrOfPages = (float) Movie.countMovies() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("movies", Movie.findAllMovies());
        }
        return "movies/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String MovieController.update(@Valid Movie movie, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, movie);
            return "movies/update";
        }
        uiModel.asMap().clear();
        movie.merge();
        return "redirect:/movies/" + encodeUrlPathSegment(movie.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String MovieController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Movie.findMovie(id));
        return "movies/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String MovieController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Movie movie = Movie.findMovie(id);
        movie.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/movies";
    }
    
    void MovieController.populateEditForm(Model uiModel, Movie movie) {
        uiModel.addAttribute("movie", movie);
    }
    
    String MovieController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
