/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.dao;

import java.sql.SQLException;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

/**
 *
 * @author ebs-pavankant
 */
public class ReportDAO extends HibernateDaoSupport {

    private ReportDAO reportDao;
//
//    public List<String> accessoryNameList() throws HibernateException, SQLException {
//        List<String> accessoryList = null;
//        Transaction tx = null;
//        Session session = getSessionFactory().openSession();
//        Query query = null;
//        try {
//            tx = session.beginTransaction();
//           query = session.createSQLQuery("select distinct accessory_name from accessories_tagging WHERE accessory_name != '' AND accessory_name IS NOT NULL order by accessory_name");
//            accessoryList = query.list();
//            tx.commit();
//        } catch (HibernateException e) {
//            e.printStackTrace();
//        } finally {
//            session.close();
//        }
//        return accessoryList;
//    }

    public List<String> assetNameListOfPDC() throws HibernateException, SQLException {
        List<String> assetNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct a.asset_name\n"
                    + "from asset_details a inner join bill_payment b on b.asset_name=a.asset_code\n"
                    + " WHERE b.Attribute1='PDC' AND a.asset_name!= '' AND a.asset_name IS NOT NULL order by a.asset_name");
            assetNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return assetNameList;
    }

    public List<String> assetTypeList() throws HibernateException, SQLException {
        List<String> assetTypeList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT distinct asset_type FROM arete_tms.depreciation_records where asset_type!='' AND asset_type IS NOT NULL ORDER BY asset_type");
            assetTypeList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return assetTypeList;
    }

    public List<String> propertyNamesList() throws HibernateException, SQLException {
        List<String> propertyNamesList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT distinct asset_name FROM arete_tms.depreciation_records where asset_name!='' AND asset_name IS NOT NULL ORDER BY asset_name");
            propertyNamesList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return propertyNamesList;
    }

    public List<String> propertiesList() throws HibernateException, SQLException {
        List<String> propertyNamesList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT distinct asset_name FROM arete_tms.sub_asset_details where asset_name!='' AND asset_name IS NOT NULL ORDER BY asset_name");
            propertyNamesList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return propertyNamesList;
    }

    public List<String> flatsNameList() throws HibernateException, SQLException {
        List<String> flatsNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT distinct sub_asset_name FROM arete_tms.depreciation_records where sub_asset_name!='' AND sub_asset_name IS NOT NULL ORDER BY sub_asset_name");
            flatsNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return flatsNameList;
    }
      public List<String> flatsName() throws HibernateException, SQLException {
        List<String> flatsNameList1 = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT distinct sub_asset_name FROM arete_tms.depreciation_records where sub_asset_name!='' AND sub_asset_name IS NOT NULL ORDER BY sub_asset_name");
            flatsNameList1 = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return flatsNameList1;
    }

    public List<String> accessoriesNameList() throws HibernateException, SQLException {
        List<String> accessoriesNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT distinct accessories_name FROM arete_tms.depreciation_records where accessories_name!='' AND accessories_name IS NOT NULL ORDER BY accessories_name");
            accessoriesNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return accessoriesNameList;
    }
//    public List<String> assetNameListFromTenantDetails() throws HibernateException, SQLException {
//        List<String> assetNameList = null;
//        Transaction tx = null;
//        Session session = getSessionFactory().openSession();
//        Query query = null;
//        try {
//            tx = session.beginTransaction();
//            query = session.createSQLQuery("select  distinct asset_name from tenant_details WHERE asset_name!= '' AND asset_name IS NOT NULL order by asset_name");
//            assetNameList = query.list();
//            tx.commit();
//        } catch (HibernateException e) {
//            e.printStackTrace();
//        } finally {
//            session.close();
//        }
//        return assetNameList;
//    }

    public List<String> leadTypeList() throws HibernateException, SQLException {
        List<String> leadList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct Lead_Type\n"
                    + "from lead WHERE Lead_Type != '' AND Lead_Type IS NOT NULL order by Lead_Type");
            leadList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return leadList;
    }

    public List<String> tenantTypeList() throws HibernateException, SQLException {
        List<String> tenantTypeList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct tenant_type\n"
                    + "from tenant_details WHERE tenant_type != '' AND tenant_type IS NOT NULL order by tenant_type");
            tenantTypeList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantTypeList;
    }

    public List<String> leadNameList() throws HibernateException, SQLException {
        List<String> leadNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct Lead_Name\n"
                    + "from lead WHERE Lead_Name != '' AND Lead_Name IS NOT NULL order by Lead_Name");
            leadNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return leadNameList;
    }

    public List<String> leadNameListFromFollowUp() throws HibernateException, SQLException {
        List<String> leadNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct Lead_Name\n"
                    + "from follow_up WHERE Lead_Name != '' AND Lead_Name IS NOT NULL order by Lead_Name");
            leadNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return leadNameList;
    }

    public List<String> campaignNameListFromCampaignDetails() throws HibernateException, SQLException {
        List<String> campaignNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct campaign_Name\n"
                    + "from campaign WHERE campaign_Name != '' AND campaign_Name IS NOT NULL order by campaign_Name");
            campaignNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return campaignNameList;
    }

    public List<String> assetNameListFromLead() throws HibernateException, SQLException {
        List<String> assetList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct Asset_Name\n"
                    + "from lead WHERE Asset_Name != '' AND Asset_Name IS NOT NULL order by Asset_Name");
            assetList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return assetList;
    }

    public List<String> tenantCodeListFromTenantDetails() throws HibernateException, SQLException {
        List<String> tenantList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct tenant_code\n"
                    + "from tenant_details WHERE (vacatestatus IS NULL OR vacatestatus!= 'Vacated' OR vacatestatus = '') AND appstatus='CFO Approved'"
                    + " AND tenant_code != '' AND tenant_code IS NOT NULL order by tenant_code");
            tenantList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantList;
    }

    public List<String> tenantNameListFromTenantDetails() throws HibernateException, SQLException {
        List<String> tenantNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct tenant_fname\n"
                    + "from tenant_details WHERE (vacatestatus IS NULL OR vacatestatus!= 'Vacated' OR vacatestatus = '') AND appstatus='CFO Approved' "
                    + "AND tenant_fname != '' AND tenant_fname IS NOT NULL order by tenant_fname");
            tenantNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantNameList;
    }

    public List<String> tenantNameListFromVacating() throws HibernateException, SQLException {
        List<String> tenantNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct Tenant_Name\n"
                    + "from vacating WHERE Tenant_Name != '' AND Tenant_Name IS NOT NULL order by Tenant_Name");
            tenantNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantNameList;
    }

    public List<String> assetNameListFromTenantDetails() throws HibernateException, SQLException {
        List<String> assetNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct asset_name\n"
                    + "from tenant_details WHERE asset_name != '' AND asset_name IS NOT NULL order by asset_name");
            assetNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return assetNameList;
    }

    public List<String> tenantCodesListFromBillPayment() throws HibernateException, SQLException {
        List<String> tenantCodeList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct tenant_code\n"
                    + "from bill_payment WHERE tenant_code != '' AND tenant_code IS NOT NULL order by tenant_code");
            tenantCodeList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantCodeList;
    }

    public List<String> tenantNameListFromBillPayment() throws HibernateException, SQLException {
        List<String> tenantNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct tenant_name\n"
                    + "from bill_payment WHERE tenant_name != '' AND tenant_name IS NOT NULL order by tenant_name");
            tenantNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantNameList;
    }

    public List<String> assetNameListFromAssetDetails() throws HibernateException, SQLException {
        List<String> assetNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct asset_name\n"
                    + "from asset_details WHERE asset_name != '' AND asset_name IS NOT NULL order by asset_name");
            assetNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return assetNameList;
    }

    public List<String> tenantNameListForServiceHistory() throws HibernateException, SQLException {
        List<String> tenantNameListForService = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct tenant_fname\n"
                    + "from tenant_details WHERE (vacatestatus IS NULL OR vacatestatus!= 'Vacated' OR vacatestatus = '') AND appstatus='CFO Approved' AND tenant_fname != '' AND tenant_fname IS NOT NULL order by tenant_fname");
            tenantNameListForService = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantNameListForService;
    }

    public List<String> tenantCodesListForServiceHistory() throws HibernateException, SQLException {
        List<String> tenantCodeListForService = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("select distinct tenant_code\n"
                    + "from tenant_details WHERE (vacatestatus IS NULL OR vacatestatus!= 'Vacated' OR vacatestatus = '') AND appstatus='CFO Approved' AND tenant_code != '' AND tenant_code IS NOT NULL order by tenant_code");
            tenantCodeListForService = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantCodeListForService;
    }

//    public List<String> getDuesByTenantName(String tenantName) throws HibernateException, SQLException {
//        List<String> tenantList = null;
//        Transaction tx = null;
//        Session session = getSessionFactory().openSession();
//        Query query = null;
//        try {
//            tx = session.beginTransaction();
//
//            query = session.createSQLQuery("select tenant_code from bill_payment WHERE  tenant_name=:tenantName AND receipt_type = 'Rent' order by tenant_code");
//            query.setString("tenantName", tenantName);
//            tenantList = query.list();
//            tx.commit();
//        } catch (HibernateException e) {
//            e.printStackTrace();
//        } finally {
//            session.close();
//        }
//        return tenantList;
//    }
//    public List<String> getDuesByTenantCode(String tenantCode) throws HibernateException, SQLException {
//        List<String> tenantList = null;
//        Transaction tx = null;
//        Session session = getSessionFactory().openSession();
//        Query query = null;
//        try {
//            tx = session.beginTransaction();
//
//            query = session.createSQLQuery("select tenant_name from bill_payment WHERE  tenant_code=:tenantCode AND receipt_type = 'Rent' order by tenant_name");
//            query.setString("tenantCode", tenantCode);
//            tenantList = query.list();
//            tx.commit();
//        } catch (HibernateException e) {
//            e.printStackTrace();
//        } finally {
//            session.close();
//        }
//        return tenantList;
//    }
    public List<String> getTenantNameByTenantCodeFromTenantDetails(String tenantCode, String assetName) throws HibernateException, SQLException {
        List<String> tenantNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (("ALL".equals(tenantCode) || "".equals(tenantCode) || tenantCode == null) && ("ALL".equals(assetName) || "".equals(assetName) || assetName == null)) {
                query = session.createSQLQuery("select distinct tenant_fname\n"
                        + "from tenant_details WHERE (vacatestatus IS NULL OR vacatestatus!= 'Vacated' OR vacatestatus = '') AND appstatus='CFO Approved' AND tenant_fname != '' AND tenant_fname IS NOT NULL order by tenant_fname");
            } else if ((("ALL".equals(tenantCode) || "".equals(tenantCode) || tenantCode == null) == true) && (("ALL".equals(assetName) || "".equals(assetName) || assetName == null) != true)) {
                query = session.createSQLQuery("select distinct b.tenant_fname from tenant_details b inner join asset_details a on b.asset_code = a.asset_code \n"
                        + "where (b.vacatestatus IS NULL OR b.vacatestatus!= 'Vacated' OR b.vacatestatus = '') AND b.appstatus='CFO Approved' and a.asset_name =:assetName AND b.tenant_fname != '' AND b.tenant_fname IS NOT NULL order by b.tenant_fname");

                query.setString("assetName", assetName);
            } else {
                query = session.createSQLQuery("select distinct tenant_fname\n"
                        + "from tenant_details WHERE tenant_code=:tenantCode AND tenant_fname != '' AND tenant_fname IS NOT NULL order by tenant_fname");

                query.setString("tenantCode", tenantCode);
            }
            tenantNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantNameList;
    }

    public List<String> getTenantCodeByServiceAssetName(String assetName) throws HibernateException, SQLException {
        List<String> tenantCodeList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if ("ALL".equals(assetName) || "".equals(assetName) || assetName == null) {
                query = session.createSQLQuery("select distinct b.tenant_code from tenant_details b inner join asset_details a on b.asset_code = a.asset_code \n"
                        + "where (b.vacatestatus IS NULL OR b.vacatestatus!= 'Vacated' OR b.vacatestatus = '') AND b.appstatus='CFO Approved' AND b.tenant_code != '' AND b.tenant_code IS NOT NULL");
            } else {
                query = session.createSQLQuery("select distinct b.tenant_code from tenant_details b inner join asset_details a on b.asset_code = a.asset_code \n"
                        + "where (b.vacatestatus IS NULL OR b.vacatestatus!= 'Vacated' OR b.vacatestatus = '') AND b.appstatus='CFO Approved' and a.asset_name =:assetName AND b.tenant_code != '' AND b.tenant_code IS NOT NULL");

                query.setString("assetName", assetName);
            }
            tenantCodeList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantCodeList;
    }

    public List<String> getTenantCodeByTenantDetailsAssetName(String assetName) throws HibernateException, SQLException {
        List<String> tenantCodeList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if ("ALL".equals(assetName) || "".equals(assetName) || assetName == null) {
                query = session.createSQLQuery("select distinct b.tenant_code from tenant_details b inner join asset_details a on b.asset_code = a.asset_code \n"
                        + "where (b.vacatestatus IS NULL OR b.vacatestatus!= 'Vacated' OR b.vacatestatus = '') AND b.appstatus='CFO Approved' AND b.tenant_code != '' AND b.tenant_code IS NOT NULL");
            } else {
                query = session.createSQLQuery("select distinct b.tenant_code from tenant_details b inner join asset_details a on b.asset_code = a.asset_code \n"
                        + "where (b.vacatestatus IS NULL OR b.vacatestatus!= 'Vacated' OR b.vacatestatus = '') AND b.appstatus='CFO Approved' and a.asset_name =:assetName AND b.tenant_code != '' AND b.tenant_code IS NOT NULL");

                query.setString("assetName", assetName);
            }
            tenantCodeList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantCodeList;
    }

    public List<String> getTenantNameByAmountDuesAssetName(String assetName) throws HibernateException, SQLException {
        List<String> tenantCodeList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if ("ALL".equals(assetName) || "".equals(assetName) || assetName == null) {
                query = session.createSQLQuery("select distinct b.tenant_fname from tenant_details b inner join asset_details a on b.asset_code = a.asset_code \n"
                        + "where (b.vacatestatus IS NULL OR b.vacatestatus!= 'Vacated' OR b.vacatestatus = '') AND b.appstatus='CFO Approved' AND b.tenant_fname != '' AND b.tenant_fname IS NOT NULL order by b.tenant_fname");
            } else {
                query = session.createSQLQuery("select distinct b.tenant_fname from tenant_details b inner join asset_details a on b.asset_code = a.asset_code \n"
                        + "where (b.vacatestatus IS NULL OR b.vacatestatus!= 'Vacated' OR b.vacatestatus = '') AND b.appstatus='CFO Approved' and a.asset_name =:assetName AND b.tenant_fname != '' AND b.tenant_fname IS NOT NULL order by b.tenant_fname");

                query.setString("assetName", assetName);
            }
            tenantCodeList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantCodeList;
    }

    public List<String> getTenantNameByServiceTenantCode(String tenantCode, String assetName) throws HibernateException, SQLException {
        List<String> tenantNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (("ALL".equals(tenantCode) || "".equals(tenantCode) || tenantCode == null) && ("ALL".equals(assetName) || "".equals(assetName) || assetName == null)) {
                query = session.createSQLQuery("select distinct tenant_fname\n"
                        + "from tenant_details WHERE (vacatestatus IS NULL OR vacatestatus!= 'Vacated' OR vacatestatus = '') AND appstatus='CFO Approved' AND tenant_fname != '' AND tenant_fname IS NOT NULL order by tenant_fname");
            } else if ((("ALL".equals(tenantCode) || "".equals(tenantCode) || tenantCode == null) == true) && (("ALL".equals(assetName) || "".equals(assetName) || assetName == null) != true)) {
                query = session.createSQLQuery("select distinct b.tenant_fname from tenant_details b inner join asset_details a on b.asset_code = a.asset_code \n"
                        + "where (b.vacatestatus IS NULL OR b.vacatestatus!= 'Vacated' OR b.vacatestatus = '') AND b.appstatus='CFO Approved' and a.asset_name =:assetName AND b.tenant_fname != '' AND b.tenant_fname IS NOT NULL order by b.tenant_fname");

                query.setString("assetName", assetName);
            } else {
                query = session.createSQLQuery("select distinct tenant_fname\n"
                        + "from tenant_details WHERE tenant_code=:tenantCode AND tenant_fname != '' AND tenant_fname IS NOT NULL order by tenant_fname");

                query.setString("tenantCode", tenantCode);
            }
            tenantNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantNameList;
    }

    public List<String> getTenantCodeByDuesAssetName(String assetName) throws HibernateException, SQLException {
        List<String> tenantCodeList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if ("ALL".equals(assetName) || "".equals(assetName) || assetName == null) {
                query = session.createSQLQuery("select distinct b.tenant_code from tenant_details b\n"
                        + "where (b.vacatestatus IS NULL OR b.vacatestatus!= 'Vacated' OR b.vacatestatus = '') AND b.appstatus='CFO Approved' AND b.tenant_code != '' AND b.tenant_code IS NOT NULL");
            } else {
                query = session.createSQLQuery("select distinct b.tenant_code from tenant_details b\n"
                        + "where (b.vacatestatus IS NULL OR b.vacatestatus!= 'Vacated' OR b.vacatestatus = '') AND b.appstatus='CFO Approved' AND b.asset_name =:assetName AND b.tenant_code != '' AND b.tenant_code IS NOT NULL");

                query.setString("assetName", assetName);
            }
            tenantCodeList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantCodeList;
    }

    public List<String> getTenantNameByDuesTenantCode(String tenantCode, String assetName) throws HibernateException, SQLException {
        List<String> tenantNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (("ALL".equals(tenantCode) || "".equals(tenantCode) || tenantCode == null) && ("ALL".equals(assetName) || "".equals(assetName) || assetName == null)) {
                query = session.createSQLQuery("select distinct tenant_fname\n"
                        + "from tenant_details WHERE (vacatestatus IS NULL OR vacatestatus!= 'Vacated' OR vacatestatus = '') AND appstatus='CFO Approved' AND tenant_fname != '' AND tenant_fname IS NOT NULL order by tenant_fname");
            } else if ((("ALL".equals(tenantCode) || "".equals(tenantCode) || tenantCode == null) == true) && (("ALL".equals(assetName) || "".equals(assetName) || assetName == null) != true)) {
                query = session.createSQLQuery("select distinct b.tenant_fname from tenant_details b inner join asset_details a on b.asset_code = a.asset_code \n"
                        + "where  a.asset_name =:assetName AND b.tenant_fname != '' AND b.tenant_fname IS NOT NULL order by tenant_fname");
            } else {
                query = session.createSQLQuery("select distinct tenant_fname\n"
                        + "from tenant_details WHERE tenant_code=:tenantCode AND tenant_fname != '' AND tenant_fname IS NOT NULL order by tenant_fname");

                query.setString("tenantCode", tenantCode);
            }
            tenantNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantNameList;
    }

    public List<String> getDepreciationAccessoryName(String flatName, String assetName) throws HibernateException, SQLException {
        List<String> tenantNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (("ALL".equals(flatName) || "".equals(flatName) || flatName == null) && ("ALL".equals(assetName) || "".equals(assetName) || assetName == null)) {
                query = session.createSQLQuery("select distinct accessories_name from arete_tms.depreciation_records WHERE accessories_name != '' AND accessories_name IS NOT NULL order by accessories_name");
            } else if ((("ALL".equals(flatName) || "".equals(flatName) || flatName == null) == true) && (("ALL".equals(assetName) || "".equals(assetName) || assetName == null) != true)) {
                query = session.createSQLQuery("select distinct accessories_name from arete_tms.depreciation_records where asset_name =:assetName AND accessories_name != '' AND accessories_name IS NOT NULL order by accessories_name");
            } else {
                query = session.createSQLQuery("select distinct accessories_name from arete_tms.depreciation_records where asset_name =:assetName AND sub_asset_name =:flatName AND\n"
                        + " accessories_name != '' AND accessories_name IS NOT NULL order by accessories_name");

                query.setString("flatName", flatName);
                query.setString("assetName", assetName);
            }
            tenantNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantNameList;
    }
    //made by pavi
     public List<String> getSubassetFlatNames(String assetName) throws HibernateException, SQLException {
        List<String> tenantNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if ("ALL".equals(assetName) || "".equals(assetName) || assetName == null) {
                query = session.createSQLQuery("SELECT distinct sub_asset_name FROM arete_tms.sub_asset_details where sub_asset_name!='' AND sub_asset_name is not null order by sub_asset_name");
            } else {
//                query = session.createSQLQuery("SELECT distinct v.Tenant_Name from vacating v inner join tenant_details t on t.tenant_code= v.Tenant_Code\n"
//                        + "where t.asset_name =:assetName AND v.Tenant_Name != '' AND v.Tenant_Name IS NOT NULL order by v.Tenant_Name");
                query = session.createSQLQuery("SELECT distinct sub_asset_name FROM arete_tms.sub_asset_details where  asset_name =:assetName AND sub_asset_name!='' AND sub_asset_name is not null order by sub_asset_name");

                query.setString("assetName", assetName);
            }
            tenantNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantNameList;
     }

    public List<String> getTenantNameByAdvanceAssetName(String assetName) throws HibernateException, SQLException {
        List<String> tenantNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if ("ALL".equals(assetName) || "".equals(assetName) || assetName == null) {
                query = session.createSQLQuery("select distinct b.tenant_fname from tenant_details b inner join asset_details a on b.asset_code = a.asset_code \n"
                        + "where (b.vacatestatus IS NULL OR b.vacatestatus!= 'Vacated' OR b.vacatestatus = '') and b.appstatus='CFO Approved' AND b.tenant_fname != '' AND b.tenant_fname IS NOT NULL order by b.tenant_fname");
            } else {
                query = session.createSQLQuery("select distinct b.tenant_fname from tenant_details b inner join asset_details a on b.asset_code = a.asset_code \n"
                        + "where (b.vacatestatus IS NULL OR b.vacatestatus!= 'Vacated' OR b.vacatestatus = '') and b.appstatus='CFO Approved' and a.asset_name =:assetName AND b.tenant_fname != '' AND b.tenant_fname IS NOT NULL order by b.tenant_fname");

                query.setString("assetName", assetName);
            }
            tenantNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantNameList;
    }

    public List<String> getTenantCodeByPenaltyAssetName(String assetName) throws HibernateException, SQLException {
        List<String> tenantCodeList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if ("ALL".equals(assetName) || "".equals(assetName) || assetName == null) {
                query = session.createSQLQuery("select distinct tenant_code from arete_tms.penalty_details order by tenant_code");
            } else {
                query = session.createSQLQuery("select distinct tenant_code from arete_tms.penalty_details where asset_name=:assetName order by tenant_code");

                query.setString("assetName", assetName);
            }
            tenantCodeList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantCodeList;
    }

    public List<String> getLandLordNameByRentPosting(String rentpostingType) throws HibernateException, SQLException {
        List<String> landlordNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if ("ALL".equals(rentpostingType) || "".equals(rentpostingType) || rentpostingType == null) {
                query = session.createSQLQuery("select distinct landlord_name from arete_tms.rent_posting order by landlord_name");
            } else {
                query = session.createSQLQuery("select distinct landlord_name from arete_tms.rent_posting where rentposting_type=:rentpostingType order by landlord_name");

                query.setString("rentpostingType", rentpostingType);
            }
            landlordNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return landlordNameList;
    }

    public List<String> getTenantNameByRentAssetName(String assetName) throws HibernateException, SQLException {
        List<String> tenantNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if ("ALL".equals(assetName) || "".equals(assetName) || assetName == null) {
                query = session.createSQLQuery("select distinct b.tenant_fname from tenant_details b inner join asset_details a on b.asset_code = a.asset_code \n"
                        + "where (b.vacatestatus IS NULL OR b.vacatestatus!= 'Vacated' OR b.vacatestatus = '') and b.appstatus='CFO Approved' AND b.tenant_fname != '' AND b.tenant_fname IS NOT NULL order by b.tenant_fname");
            } else {
                query = session.createSQLQuery("select distinct b.tenant_fname from tenant_details b inner join asset_details a on b.asset_code = a.asset_code \n"
                        + "where (b.vacatestatus IS NULL OR b.vacatestatus!= 'Vacated' OR b.vacatestatus = '') and b.appstatus='CFO Approved' and a.asset_name =:assetName AND b.tenant_fname != '' AND b.tenant_fname IS NOT NULL order by b.tenant_fname");

                query.setString("assetName", assetName);
            }
            tenantNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantNameList;
    }

    public List<String> getTenantNameByServiceAssetName(String assetName) throws HibernateException, SQLException {
        List<String> tenantNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if ("ALL".equals(assetName) || "".equals(assetName) || assetName == null) {
                query = session.createSQLQuery("select distinct b.tenant_fname from tenant_details b inner join asset_details a on b.asset_code = a.asset_code \n"
                        + "where (b.vacatestatus IS NULL OR b.vacatestatus!= 'Vacated' OR b.vacatestatus = '') AND b.appstatus='CFO Approved' AND b.tenant_fname != '' AND b.tenant_fname IS NOT NULL order by b.tenant_fname");
            } else {
                query = session.createSQLQuery("select distinct b.tenant_fname from tenant_details b inner join asset_details a on b.asset_code = a.asset_code \n"
                        + "where (b.vacatestatus IS NULL OR b.vacatestatus!= 'Vacated' OR b.vacatestatus = '') AND b.appstatus='CFO Approved' and a.asset_name =:assetName AND b.tenant_fname != '' AND b.tenant_fname IS NOT NULL order by b.tenant_fname");

                query.setString("assetName", assetName);
            }
            tenantNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantNameList;
    }

    public List<String> getTenantNameByTenantDetailsAssetName(String assetName) throws HibernateException, SQLException {
        List<String> tenantNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if ("ALL".equals(assetName) || "".equals(assetName) || assetName == null) {
                query = session.createSQLQuery("select distinct b.tenant_fname from tenant_details b inner join asset_details a on b.asset_code = a.asset_code \n"
                        + "where (b.vacatestatus IS NULL OR b.vacatestatus!= 'Vacated' OR b.vacatestatus = '') AND b.appstatus='CFO Approved' AND b.tenant_fname != '' AND b.tenant_fname IS NOT NULL order by b.tenant_fname");
            } else {
                query = session.createSQLQuery("select distinct b.tenant_fname from tenant_details b inner join asset_details a on b.asset_code = a.asset_code \n"
                        + "where (b.vacatestatus IS NULL OR b.vacatestatus!= 'Vacated' OR b.vacatestatus = '') AND b.appstatus='CFO Approved' and a.asset_name =:assetName AND b.tenant_fname != '' AND b.tenant_fname IS NOT NULL order by b.tenant_fname");

                query.setString("assetName", assetName);
            }
            tenantNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantNameList;
    }
    //made by pavi

    public List<String> getTenantNameByflatDetailsAssetName(String assetName) throws HibernateException, SQLException {
        List<String> tenantNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if ("ALL".equals(assetName) || "".equals(assetName) || assetName == null) {
                query = session.createSQLQuery("select distinct b.flat_no from tenant_details b inner join asset_details a on b.asset_code = a.asset_code where (b.vacatestatus IS NULL OR b.vacatestatus!= 'Vacated' OR b.vacatestatus = '') AND b.appstatus='CFO Approved' AND b.flat_no != ''AND b.flat_no IS NOT NULL order by b.flat_no");
            } else {
                query = session.createSQLQuery("select distinct b.flat_no from tenant_details b inner join asset_details a on b.asset_code = a.asset_code \n"
                        + "where (b.vacatestatus IS NULL OR b.vacatestatus!= 'Vacated' OR b.vacatestatus = '') AND b.appstatus='CFO Approved' and a.asset_name =:assetName AND b.flat_no != '' AND b.flat_no IS NOT NULL order by b.flat_no");

                query.setString("assetName", assetName);
            }
            tenantNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantNameList;
    }
    public List<String> getTenantNameByDuesAssetName(String assetName) throws HibernateException, SQLException {
        List<String> tenantNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if ("ALL".equals(assetName) || "".equals(assetName) || assetName == null) {
                query = session.createSQLQuery("select distinct b.tenant_fname from tenant_details b\n"
                        + "where (b.vacatestatus IS NULL OR b.vacatestatus!= 'Vacated' OR b.vacatestatus = '') AND b.appstatus='CFO Approved' AND  b.tenant_fname != '' AND b.tenant_fname IS NOT NULL order by b.tenant_fname");
            } else {
                query = session.createSQLQuery("select distinct b.tenant_fname from tenant_details b\n"
                        + "where (b.vacatestatus IS NULL OR b.vacatestatus!= 'Vacated' OR b.vacatestatus = '') AND b.appstatus='CFO Approved' AND  b.asset_name =:assetName AND b.tenant_fname != '' AND b.tenant_fname IS NOT NULL order by b.tenant_fname");

                query.setString("assetName", assetName);
            }
            tenantNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantNameList;
    }

    public List<String> getLeadNameByFollowUpLeadType(String leadType) throws HibernateException, SQLException {
        List<String> leadNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if ("ALL".equals(leadType) || "".equals(leadType) || leadType == null) {
                query = session.createSQLQuery("SELECT distinct f.Lead_Name FROM follow_up f inner join lead l on l.Lead_Co"
                        + "de=f.Lead_Code where f.Lead_Name !='' AND f.Lead_Name IS NOT NULL order by f.Lead_Name");

            } else {
                query = session.createSQLQuery("SELECT distinct f.Lead_Name FROM follow_up f inner join lead l on l.Lead_Code=f.Lead_Code"
                        + " where l.Lead_Type =:leadType AND f.Lead_Name !='' AND f.Lead_Name IS NOT NULL order by f.Lead_Name");

                query.setString("leadType", leadType);
            }
            leadNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return leadNameList;
    }

    public List<String> getLeadNameByLeadDetailsLeadType(String leadType) throws HibernateException, SQLException {
        List<String> leadNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;

        try {
            tx = session.beginTransaction();
            if ("ALL".equals(leadType) || "".equals(leadType) || leadType == null) {
                query = session.createSQLQuery("SELECT distinct Lead_Name FROM lead where Lead_Name != '' AND Lead_Name IS NOT NULL order by Lead_Name");
            } else {
                query = session.createSQLQuery("SELECT distinct Lead_Name FROM lead where Lead_Type =:leadType AND Lead_Name != '' AND Lead_Name IS NOT NULL order by Lead_Name");

                query.setString("leadType", leadType);
            }

            leadNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return leadNameList;
    }

    public List<String> getVacateTenantName(String assetName) throws HibernateException, SQLException {
        List<String> tenantNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if ("ALL".equals(assetName) || "".equals(assetName) || assetName == null) {
                query = session.createSQLQuery("SELECT distinct v.Tenant_Name from vacating v inner join tenant_details t on t.tenant_code= v.Tenant_Code\n"
                        + "where v.Tenant_Name != '' AND v.Tenant_Name IS NOT NULL order by v.Tenant_Name");
            } else {
                query = session.createSQLQuery("SELECT distinct v.Tenant_Name from vacating v inner join tenant_details t on t.tenant_code= v.Tenant_Code\n"
                        + "where t.asset_name =:assetName AND v.Tenant_Name != '' AND v.Tenant_Name IS NOT NULL order by v.Tenant_Name");

                query.setString("assetName", assetName);
            }
            tenantNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantNameList;
    }

    public List<String> getDepreciationFlatNames(String assetName) throws HibernateException, SQLException {
        List<String> tenantNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if ("ALL".equals(assetName) || "".equals(assetName) || assetName == null) {
                query = session.createSQLQuery("SELECT distinct sub_asset_name FROM arete_tms.depreciation_records where sub_asset_name!='' AND sub_asset_name is not null order by sub_asset_name");
            } else {
//                query = session.createSQLQuery("SELECT distinct v.Tenant_Name from vacating v inner join tenant_details t on t.tenant_code= v.Tenant_Code\n"
//                        + "where t.asset_name =:assetName AND v.Tenant_Name != '' AND v.Tenant_Name IS NOT NULL order by v.Tenant_Name");
                query = session.createSQLQuery("SELECT distinct sub_asset_name FROM arete_tms.depreciation_records where  asset_name =:assetName AND sub_asset_name!='' AND sub_asset_name is not null order by sub_asset_name");

                query.setString("assetName", assetName);
            }
            tenantNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantNameList;
    }

    public List<String> getDepreciationAssetAccessoryName(String assetName) throws HibernateException, SQLException {
        List<String> tenantNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if ("ALL".equals(assetName) || "".equals(assetName) || assetName == null) {
                query = session.createSQLQuery("SELECT distinct accessories_name FROM arete_tms.depreciation_records where accessories_name!='' AND accessories_name is not null order by accessories_name");
            } else {
//                query = session.createSQLQuery("SELECT distinct v.Tenant_Name from vacating v inner join tenant_details t on t.tenant_code= v.Tenant_Code\n"
//                        + "where t.asset_name =:assetName AND v.Tenant_Name != '' AND v.Tenant_Name IS NOT NULL order by v.Tenant_Name");
                query = session.createSQLQuery("SELECT distinct accessories_name FROM arete_tms.depreciation_records where  asset_name =:assetName AND accessories_name!='' AND accessories_name is not null order by accessories_name");

                query.setString("assetName", assetName);
            }
            tenantNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantNameList;
    }

    public List<String> getRenewalTenantNameByAssetName(String assetName) throws HibernateException, SQLException {
        List<String> tenantNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if ("ALL".equals(assetName) || "".equals(assetName) || assetName == null) {
                query = session.createSQLQuery("select distinct tenant_fname\n"
                        + "from tenant_details WHERE (vacatestatus IS NULL OR vacatestatus!= 'Vacated' OR vacatestatus = '') AND appstatus='CFO Approved'"
                        + " AND tenant_fname != '' AND tenant_fname IS NOT NULL order by tenant_fname");
            } else {
                query = session.createSQLQuery("select distinct tenant_fname\n"
                        + "from tenant_details WHERE (vacatestatus IS NULL OR vacatestatus!= 'Vacated' OR vacatestatus = '') AND appstatus='CFO Approved'"
                        + " AND asset_name=:assetName AND tenant_fname != '' AND tenant_fname IS NOT NULL order by tenant_fname");

                query.setString("assetName", assetName);
            }
            tenantNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantNameList;
    }

    public List<String> penaltyAssetNameList() throws HibernateException, SQLException {
        List<String> penaltyAssetNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT distinct asset_name FROM arete_tms.penalty_details order by asset_name");
            penaltyAssetNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return penaltyAssetNameList;
    }

    public List<String> penaltyTenantCodeList() throws HibernateException, SQLException {
        List<String> penaltyTenantCodeList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct tenant_code from arete_tms.penalty_details order by tenant_code");
            penaltyTenantCodeList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return penaltyTenantCodeList;
    }

    public List<String> landlordNameList() throws HibernateException, SQLException {
        List<String> landlordNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct landlord_name from arete_tms.rent_posting order by landlord_name");
            landlordNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return landlordNameList;
    }

    public List<String> utilityTenantCodeList() throws HibernateException, SQLException {
        List<String> utilityTenantCodeList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT distinct tenant_code FROM arete_tms.utility_details order by tenant_code");
            utilityTenantCodeList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return utilityTenantCodeList;
    }

    public List<String> rentPostingList() throws HibernateException, SQLException {
        List<String> rentPostingList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT distinct rentposting_type FROM arete_tms.rent_posting order by rentposting_type");
            rentPostingList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return rentPostingList;
    }

    public List<String> supplierName() throws HibernateException, SQLException {
        List<String> rentPostingList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT distinct SUPPLIER_NAME FROM arete_tms.supplier_master order by SNO");
            rentPostingList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return rentPostingList;
    }

    public List<String> itemNameList() throws HibernateException, SQLException {
        List<String> itemList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT DISTINCT ITEM_NAME\n"
                    + "FROM arete_tms.item_master");
            itemList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return itemList;
    }

    public List<String> storeNameList() throws HibernateException, SQLException {
        List<String> itemList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT DISTINCT store_name FROM arete_tms.store_master");
            itemList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return itemList;
    }

    public List<String> itemcodeList() throws HibernateException, SQLException {
        List<String> itemList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT DISTINCT ITEM_CODE\n"
                    + "FROM arete_tms.item_master");
            itemList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return itemList;
    }

    public List<String> itemNameListP() throws HibernateException, SQLException {
        List<String> itemList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT DISTINCT item_name\n"
                    + "FROM arete_tms.purchase_order");
            itemList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return itemList;
    }

    public List<String> itemNameListAP() throws HibernateException, SQLException {
        List<String> itemList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT DISTINCT approval_status\n"
                    + "FROM arete_tms.purchase_order");
            itemList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return itemList;
    }

    public List<String> itemCodeList1() throws HibernateException, SQLException {
        List<String> itemlist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct item_name from purchase_request  WHERE item_name IS NOT NULL order by item_name");
            itemlist = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return itemlist;
    }

    public List<String> itemCategoryList1() throws HibernateException, SQLException {
        List<String> itemlist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct ITEM_CATEGORY from item_master WHERE ITEM_CATEGORY IS NOT NULL order by ITEM_CATEGORY");
            itemlist = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return itemlist;
    }

    public List<String> statusList1() throws HibernateException, SQLException {
        List<String> itemlist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct record_status from purchase_request WHERE record_status IS NOT NULL order by record_status");
            itemlist = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return itemlist;
    }

    public List<String> supplierNameList() throws HibernateException, SQLException {
        List<String> itemList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT DISTINCT s.SUPPLIER_NAME\n"
                    + "FROM arete_tms.material_return m inner join arete_tms.supplier_master s\n"
                    + "ON m.supplier_name=s.SUPPLIER_CODE");
            itemList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return itemList;
    }
    
    //added by pavi for purchase report propertyvice
    public List<String> PropertyName() throws HibernateException, SQLException {
        List<String> assetNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct asset_category from purchase_order WHERE asset_category != '' AND asset_category IS NOT NULL order by asset_category");
            assetNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return assetNameList;
    }
    
    
      //added by pavi for purchase report propertyvice
    public List<String> UserIDFromAging() throws HibernateException, SQLException {
        List<String> assetNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct user_id from arete_tms.report_agingreport WHERE user_id != '' AND user_id IS NOT NULL order by user_id");
            assetNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return assetNameList;
    }
    
    public List<String> getLedgerNo() throws HibernateException, SQLException {
        List<String> assetNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select ledger_no from arete_tms.ledger_master");
            assetNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return assetNameList;
    }
     //Added by pavi for purchase report propertyvice

    public List<String> PropertyName1() throws HibernateException, SQLException {
        List<String> assetNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct asset_category from purchase_request WHERE asset_category != '' AND asset_category IS NOT NULL order by asset_category");
            assetNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return assetNameList;
    }

    //added by pavi to get the flat name 
    public List<String> flatsName1() throws HibernateException, SQLException {
        List<String> flatsNameList1 = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT distinct sub_asset_category FROM arete_tms.purchase_order where sub_asset_category!='' AND sub_asset_category IS NOT NULL ORDER BY sub_asset_category");
            flatsNameList1 = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return flatsNameList1;
    }
//added by pavi to get flat name
    public List<String> flatsName2() throws HibernateException, SQLException {
        List<String> flatsNameList1 = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT distinct sub_asset_category FROM arete_tms.purchase_request where sub_asset_category!='' AND sub_asset_category IS NOT NULL ORDER BY sub_asset_category");
            flatsNameList1 = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return flatsNameList1;
    }

//added by pavi to get flat name according to property name
    public List<String> getFlatNames(String assetName) throws HibernateException, SQLException {
        List<String> tenantNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if ("ALL".equals(assetName) || "".equals(assetName) || assetName == null) {
                query = session.createSQLQuery("SELECT distinct sub_asset_category FROM arete_tms.purchase_order where sub_asset_category!='' AND sub_asset_category is not null order by sub_asset_category");
            } else {
//                query = session.createSQLQuery("SELECT distinct v.Tenant_Name from vacating v inner join tenant_details t on t.tenant_code= v.Tenant_Code\n"
//                        + "where t.asset_name =:assetName AND v.Tenant_Name != '' AND v.Tenant_Name IS NOT NULL order by v.Tenant_Name");
                query = session.createSQLQuery("SELECT distinct sub_asset_category FROM arete_tms.purchase_order where  asset_category =:assetName AND sub_asset_category!='' AND sub_asset_category is not null order by sub_asset_category");

                query.setString("assetName", assetName);
            }
            tenantNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantNameList;
    }
    //added by pavi to get flat name 
    public List<String> getReqFlatNames(String assetName) throws HibernateException, SQLException {
        List<String> tenantNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if ("ALL".equals(assetName) || "".equals(assetName) || assetName == null) {
                query = session.createSQLQuery("SELECT distinct sub_asset_category FROM arete_tms.purchase_request where sub_asset_category!='' AND sub_asset_category is not null order by sub_asset_category");
            } else {
//                query = session.createSQLQuery("SELECT distinct v.Tenant_Name from vacating v inner join tenant_details t on t.tenant_code= v.Tenant_Code\n"
//                        + "where t.asset_name =:assetName AND v.Tenant_Name != '' AND v.Tenant_Name IS NOT NULL order by v.Tenant_Name");
                query = session.createSQLQuery("SELECT distinct sub_asset_category FROM arete_tms.purchase_request where  asset_category =:assetName AND sub_asset_category!='' AND sub_asset_category is not null order by sub_asset_category");

                query.setString("assetName", assetName);
            }
            tenantNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantNameList;
    }
    //added by pavi for rent reports
    public List<String> rentProperty1() throws HibernateException, SQLException {
        List<String> flatsNameList1 = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT  distinct a.asset_name from arete_tms.asset_details a inner join arete_tms.bill_payment b on a.asset_code=b.asset_name and a.asset_name != '' AND a.asset_name IS NOT NULL order by a.asset_name;");
            flatsNameList1 = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return flatsNameList1;
    }
     public List<String> rentPropertyname1() throws HibernateException, SQLException {
        List<String> flatsNameList1 = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct a.asset_name\n"
                    + "from asset_details a inner join bill_payment b on b.asset_name=a.asset_code\n");
            flatsNameList1 = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return flatsNameList1;
    }

    public List<String> rentTenant1() throws HibernateException, SQLException {
        List<String> accessoriesNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT distinct tenant_name FROM arete_tms.bill_payment WHERE tenant_name != '' AND tenant_name IS NOT NULL order by tenant_name;");
            accessoriesNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return accessoriesNameList;
    }
       public List<String> rentFlat1() throws HibernateException, SQLException {
        List<String> accessoriesNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT distinct sub_asset_name FROM arete_tms.sub_asset_details WHERE sub_asset_name != '' AND sub_asset_name IS NOT NULL order by sub_asset_name;");
            accessoriesNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return accessoriesNameList;
    }
         //added by pavi
    public List<String> getRentTenantNames(String assetName) throws HibernateException, SQLException {
        List<String> tenantNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if ("ALL".equals(assetName) || "".equals(assetName) || assetName == null) {
                query = session.createSQLQuery("SELECT distinct tenant_name FROM arete_tms.bill_payment where tenant_name!='' AND tenant_name is not null order by tenant_name");
            } else {
//                query = session.createSQLQuery("SELECT distinct v.Tenant_Name from vacating v inner join tenant_details t on t.tenant_code= v.Tenant_Code\n"
//                        + "where t.asset_name =:assetName AND v.Tenant_Name != '' AND v.Tenant_Name IS NOT NULL order by v.Tenant_Name");
                query = session.createSQLQuery("select distinct b.tenant_name from bill_payment b join arete_tms.asset_details a on a.asset_code = b.asset_name and a.asset_name=:assetName AND b.tenant_name!='' AND b.tenant_name is not null order by tenant_name");

                query.setString("assetName", assetName);
            }
            tenantNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantNameList;
    
    }
        public List<String> getRentFlatNames(String assetName) throws HibernateException, SQLException {
        List<String> tenantNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if ("ALL".equals(assetName) || "".equals(assetName) || assetName == null) {
                query = session.createSQLQuery("SELECT distinct sub_asset_name FROM arete_tms.sub_asset_details where sub_asset_name!='' AND sub_asset_name is not null order by sub_asset_name");
            } else {
//                query = session.createSQLQuery("SELECT distinct v.Tenant_Name from vacating v inner join tenant_details t on t.tenant_code= v.Tenant_Code\n"
//                        + "where t.asset_name =:assetName AND v.Tenant_Name != '' AND v.Tenant_Name IS NOT NULL order by v.Tenant_Name");
                query = session.createSQLQuery("SELECT distinct sub_asset_name FROM arete_tms.sub_asset_details where  asset_code =:assetName AND sub_asset_name!='' AND sub_asset_name is not null order by sub_asset_name");

                query.setString("assetName", assetName);
            }
            tenantNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantNameList;
    
    }
        
    public List<String> getRentFlatNames1(String assetName) throws HibernateException, SQLException {
        List<String> tenantNameList = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if ("ALL".equals(assetName) || "".equals(assetName) || assetName == null) {
                query = session.createSQLQuery("SELECT distinct flat_no	 FROM arete_tms.bill_payment where flat_no!='' AND flat_no is not null order by flat_no");
            } else {
//                query = session.createSQLQuery("SELECT distinct v.Tenant_Name from vacating v inner join tenant_details t on t.tenant_code= v.Tenant_Code\n"
//                        + "where t.asset_name =:assetName AND v.Tenant_Name != '' AND v.Tenant_Name IS NOT NULL order by v.Tenant_Name");
                query = session.createSQLQuery("select distinct b.flat_no from bill_payment b join arete_tms.asset_details a on a.asset_code = b.asset_name and a.asset_name=:assetName AND b.flat_no!='' AND b.flat_no is not null order by b.flat_no");

                query.setString("assetName", assetName);
            }
            tenantNameList = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tenantNameList;
    
    }
}



