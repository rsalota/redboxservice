// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.openwebsys.redrates;

import com.openwebsys.redrates.Movie;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Movie_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Movie.entityManager;
    
    public static final EntityManager Movie.entityManager() {
        EntityManager em = new Movie().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Movie.countMovies() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Movie o", Long.class).getSingleResult();
    }
    
    public static List<Movie> Movie.findAllMovies() {
        return entityManager().createQuery("SELECT o FROM Movie o", Movie.class).getResultList();
    }
    
    public static Movie Movie.findMovie(Long id) {
        if (id == null) return null;
        return entityManager().find(Movie.class, id);
    }
    
    public static List<Movie> Movie.findMovieEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Movie o", Movie.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Movie.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Movie.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Movie attached = Movie.findMovie(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Movie.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Movie.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Movie Movie.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Movie merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
