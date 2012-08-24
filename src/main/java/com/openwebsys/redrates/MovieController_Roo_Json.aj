// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.openwebsys.redrates;

import com.openwebsys.redrates.MovieController;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect MovieController_Roo_Json {
    
    public String MovieController.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static MovieController MovieController.fromJsonToMovieController(String json) {
        return new JSONDeserializer<MovieController>().use(null, MovieController.class).deserialize(json);
    }
    
    public static String MovieController.toJsonArray(Collection<MovieController> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<MovieController> MovieController.fromJsonArrayToMovieControllers(String json) {
        return new JSONDeserializer<List<MovieController>>().use(null, ArrayList.class).use("values", MovieController.class).deserialize(json);
    }
    
}
