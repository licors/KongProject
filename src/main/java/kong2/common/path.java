/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kong2.common;

/**
 *
 * @author user2
 */
public class path {

    private static path pathname = new path();

    public static path path() {
        return pathname;
    }

    public String p() {
        return this.getClass().getResource("").getPath();
    }
}
