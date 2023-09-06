/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.other.classes;

import java.util.List;

/**
 *
 * @author ebs-sdd10
 */
public interface commonInterface {

    public void globalSave(Object transientInstance);

    public List<Class> list(String instanceVariable, String className);

    public List<Class> list(Integer instanceVariable, String className);

    public void globalInactive(String instanceVariable, String className);

    public void globalDelete(Integer instanceVariable);

    public List<Class> roleperm(String orgId, String roleName, String submoduleName, String tab);

}
