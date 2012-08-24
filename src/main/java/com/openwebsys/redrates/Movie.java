package com.openwebsys.redrates;

import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(entityName = "Movie")
@RooJson
public class Movie {

    @Size(max = 1024)
    private String movieName;

    @Size(max = 1024)
    private String movieTrailerUrl;

    private int rtRating;

    private int imdbRating;

    @Size(max = 1024)
    private String rtUrl;

    @Size(max = 1024)
    private String imdbUrl;

    @Size(max = 256)
    private String genre;

    private Boolean isComingSoon;

    private Boolean isActive;
}
