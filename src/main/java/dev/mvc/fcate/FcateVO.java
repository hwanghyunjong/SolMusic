package dev.mvc.fcate;

/*
 * cateno      NUMBER(10)     NOT NULL    PRIMARY KEY,
   name        VARCHAR(50)    NOT NULL
 */

public class FcateVO {
  private int cateno;
  private String name;
  
  public int getCateno() {
    return cateno;
  }
  public void setCateno(int cateno) {
    this.cateno = cateno;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
}
