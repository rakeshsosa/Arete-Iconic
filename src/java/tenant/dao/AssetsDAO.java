/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.dao;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.web.multipart.MultipartFile;
import tenant.classes.AccessoriesTagging;
import tenant.classes.SubAssetDetails;
import tenant.classes.AssetDetails;
import tenant.classes.DepreciationRecords;
import tenant.classes.RevaluationOfAsset;
import tenant.classes.SplitAsset;
import tenant.classes.ItemMaster;
import tenant.classes.RevaluationAttach;
import tenant.classes.SplitAssetAttachment;
import tenant.classes.UserRegistration;

/**
 *
 * @author ebs
 */
public class AssetsDAO extends HibernateDaoSupport {

    private static final String dir = System.getProperty("user.dir");

    //================= To Save Depreciation Details ========================
    public void saveOrUpdate(DepreciationRecords depreciationRecords) {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(depreciationRecords);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }

    //================= To Fetch Depreciation Details ========================
    public List<DepreciationRecords> depreciationList() {
        List<DepreciationRecords> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from DepreciationRecords GROUP BY depreCode");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    //================= To Fetch Property Details ========================
    public List<AssetDetails> depreciationAssetNameList(String assetCode) {
        List<AssetDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from AssetDetails where assetCode='" + assetCode + "'");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    //================= To Fetch Floor Details ========================
    public List<SubAssetDetails> depreciationListSubAssetView(String subAssetCode) {
        List<SubAssetDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from SubAssetDetails where subAssetCode='" + subAssetCode + "'");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    //================= To Fetch Accessories Details ========================
    public List<ItemMaster> depreciationListAccessoriesView(String accessoriesCode) {
        List<ItemMaster> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from ItemMaster where itemCode='" + accessoriesCode + "'");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    //================= To Fetch Depreciation Details ========================
    public List<DepreciationRecords> depreciationListView(String depreCode) {
        List<DepreciationRecords> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (depreCode != null) {
                query = session.createQuery("from DepreciationRecords where depreCode='" + depreCode + "'");
            } else {
                query = session.createQuery("from DepreciationRecords order by s_no asc");
            }
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    //================= To Fetch Depreciation Details ========================
    public List<DepreciationRecords> depreciationListViewUnique(String depreCode) {
        List<DepreciationRecords> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (depreCode != null) {
                query = session.createQuery("from DepreciationRecords where depreCode='" + depreCode + "' Group by depreCode");
            } else {
                query = session.createQuery("from DepreciationRecords order by s_no asc");
            }
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    //================= To Fetch Depreciation Details ========================
    public List<DepreciationRecords> assetCodeList(String SNo) {
        List<DepreciationRecords> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo != null && (!"".equals(SNo))) {
                Integer sno = Integer.parseInt(SNo);
                query = session.createQuery("from DepreciationRecords where s_no='" + sno + "' order by s_no asc");
            } else {
                query = session.createQuery("from DepreciationRecords ORDER BY cast(substring(depreCode,10)  as int) desc");
            }
            query.setMaxResults(1);
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    //================= To Fetch Depreciation Details ========================
    public List<DepreciationRecords> assetCodeListByAssetCode(String depreCode) {
        List<DepreciationRecords> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (depreCode != null && (!"".equals(depreCode))) {
                //Integer sno = Integer.parseInt(SNo);
                query = session.createQuery("from DepreciationRecords where depreCode='" + depreCode + "' order by s_no asc");
            } else {
                query = session.createQuery("from DepreciationRecords ORDER BY cast(substring(depreCode,10)  as int) desc");
            }
            query.setMaxResults(1);
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    // PopUp Details
    //================= To Fetch Property Details ========================
    public List<AssetDetails> selectAssetPopUp() throws IOException {
        Transaction tx = null;
        List<AssetDetails> list = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from AssetDetails");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;

    }

    //================= To Fetch Flat Details ========================
    public List<SubAssetDetails> selectSubAssetPopUp(String assetCode) throws IOException {
        Transaction tx = null;
        List<SubAssetDetails> list = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from SubAssetDetails where assetCode='" + assetCode + "' ");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;

    }

    //================= To Fetch Accessories Tagging Details ========================
    public List<AccessoriesTagging> SelectAccessoriesPopUp(String assetCode, String subAssetCode) throws IOException {
        Transaction tx = null;
        List<AccessoriesTagging> list = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from AccessoriesTagging where assetCode='" + assetCode + "'and subAssetCode='" + subAssetCode + "' ");
            //   query = session.createQuery("from AccessoryType ");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;

    }

    // ================End================
    /*
     DAO for Split Of Asset from Asset Management
     
     */
    //save or update the Records for split of Asset 
    public void saveOrUpdate(SplitAsset splitAssetRecords) {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(splitAssetRecords);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }
    /*  get the new asset code from database */

    public List<SplitAsset> assetSplitCodeList(String SNo) {
        List<SplitAsset> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo != null) {
                int sno = Integer.parseInt(SNo);
                query = session.createQuery("from SplitAsset where s_no='" + sno + "' order by s_no asc");
            } else {
                query = session.createQuery("from SplitAsset ORDER BY s_no DESC");
            }
            query.setMaxResults(1);// to get first record
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    /*  select the asset List from database */
    public List<SplitAsset> assetSplitList() {
        List<SplitAsset> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from SplitAsset");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    /* view  Split List View  */
    public List<SplitAsset> assetSplitListView(Integer sno) {
        List<SplitAsset> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from SplitAsset where s_no='" + sno + "' order by s_no asc");
            } else {
                query = session.createQuery("from SplitAsset order by s_no asc");
            }
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    // Retrieve records for assetCode, assetname, subassetCode, subAssetName by using popup
    public List<SubAssetDetails> assetDetailsList() throws IOException {
        Transaction tx = null;
        List<SubAssetDetails> list = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from SubAssetDetails ");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;

    }

    /*
     DAO for Revaluation Of Asset from Asset Management
     */
    //save or update the Records for Revaluation of Asset 
    public void saveOrUpdate(RevaluationOfAsset revaluationOfAsset) {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(revaluationOfAsset);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }

    /*  select the Revaluation Of Asset List from database */
    public List<RevaluationOfAsset> revaluationOfAssetList() {
        List<RevaluationOfAsset> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from RevaluationOfAsset");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    /* view/edit  List */
    public List<RevaluationOfAsset> revaluationOfAsseListView(Integer sno) {
        List<RevaluationOfAsset> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from RevaluationOfAsset where s_no='" + sno + "' order by s_no asc");
            } else {
                query = session.createQuery("from RevaluationOfAsset order by s_no asc");
            }
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    public void assetsInactive(String instanceVariable, String className) {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "update " + className + " set status='Inactive' where SNo=" + instanceVariable + "";
            Query query = session.createQuery(hql);
            query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }

    }

    public List<String[]> getAssetCumulativeValue(String assetCode)
            throws HibernateException, SQLException {
        List<String[]> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select cumulativeAmount, depreciationPercent, purchaseVoucherNo, purchaseDate, dipreciationFirstDate, noOfDays\n"
                    + "from depreciation_records where asset_code='" + assetCode + "' AND (sub_asset_code ='' or sub_asset_code is null) AND \n"
                    + "(accessories_code='' or accessories_code is null) AND asset_code!='' AND asset_code IS NOT NULL  order by s_no desc");

            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;

    }

    public List<String[]> getAccessoryCumulativeValue(String assetCode, String subAssetCode, String accessoryCode)
            throws HibernateException, SQLException {
        List<String[]> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("select cumulativeAmount, depreciationPercent, purchaseVoucherNo, purchaseDate, dipreciationFirstDate, noOfDays, poNo, asset_value\n"
                    + "from depreciation_records where asset_code='" + assetCode + "' AND sub_asset_code ='" + subAssetCode + "' AND \n"
                    + "accessories_code='" + accessoryCode + "' AND asset_code!='' AND asset_code IS NOT NULL AND sub_asset_code!='' AND sub_asset_code IS NOT NULL AND  accessories_code!='' AND accessories_code IS NOT NULL order by s_no desc");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;

    }

    public List<Object[]> getDepreciationsLists(String assetCode, String subAssetCode, String accessoryCode, String startDate)
            throws HibernateException, SQLException {
        List<Object[]> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (subAssetCode == null || "".equals(subAssetCode) || accessoryCode == null || "".equals(accessoryCode)) {
                query = session.createSQLQuery("select * from depreciation_records where asset_code='" + assetCode + "' AND depreciationEndDate>='" + startDate + "'  AND (sub_asset_code ='' or sub_asset_code is null) AND \n"
                        + "(accessories_code='' or accessories_code is null) AND asset_code!='' AND asset_code IS NOT NULL  order by s_no desc");
            } else {
                query = session.createSQLQuery("select * from depreciation_records where asset_code='" + assetCode + "'  AND depreciationEndDate>='" + startDate + "' AND sub_asset_code ='" + subAssetCode + "' AND \n"
                        + "accessories_code='" + accessoryCode + "' AND asset_code!='' AND asset_code IS NOT NULL AND sub_asset_code!='' AND sub_asset_code IS NOT NULL AND  accessories_code!='' AND accessories_code IS NOT NULL order by s_no desc");
            }

            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;

    }

    //// Property Unique method    
    public void selectProperty(HttpServletRequest req, HttpServletResponse res, String asstcod, String subAsset, String accessory) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<DepreciationRecords> citydata = null;
        try {
            tx = session.beginTransaction();
            if (accessory.equals("") && subAsset.equals("")) {
                query = session.createSQLQuery("select asset_code\n"
                        + "               FROM arete_tms.depreciation_records\n"
                        + "             where asset_code='" + asstcod + "' and (sub_asset_code='' or sub_asset_code is null) and STATUS!='Inactive'");

            } else if ((accessory.equals(""))) {
                query = session.createSQLQuery("select asset_code,sub_asset_code\n"
                        + "            FROM arete_tms.depreciation_records\n"
                        + "            where asset_code='" + asstcod + "' and sub_asset_code='" + subAsset + "' and STATUS!='Inactive'");
            } else {
                query = session.createSQLQuery("select asset_code,sub_asset_code,accessories_code\n"
                        + "            FROM arete_tms.depreciation_records\n"
                        + "            where asset_code='" + asstcod + "' and sub_asset_code='" + subAsset + "'and accessories_code='" + accessory + "' and STATUS!='Inactive'");
            }
            citydata = query.list();
            if (citydata.isEmpty()) {
                out.append("Available");

            } else {
                out.append("Already Exists.Enter another");
            }
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }

    //--------------- To fetch Property Details Attachment---------------------------//
    public List<RevaluationAttach> revaluationDocuments(String assetCode) {
        List<RevaluationAttach> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from RevaluationAttach where assetCode='" + assetCode + "' and status!='Inactive'");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

//    public RevaluationAttach getRevaluationAttach(Integer id) {
//        Session session = getSessionFactory().openSession();
//        RevaluationAttach exp = (RevaluationAttach) session.get(RevaluationAttach.class, id);
//        session.close();
//        return exp;
//    }
    public void revaluationDocSave(List<RevaluationAttach> grid) throws HibernateException, SQLException {
        for (Iterator<RevaluationAttach> iterator = grid.iterator(); iterator.hasNext();) {
            RevaluationAttach sales = (RevaluationAttach) iterator.next();
            revaluationDocumentsSave(sales);
        }
    }

    //--------------- To save Property Details Attachment---------------------------//
    public void revaluationDocumentsSave(RevaluationAttach transientInstance) {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.save(transientInstance);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.close();

        } finally {
            session.clear();
            session.close();
        }
    }

    //--------------- To delete Property Details Attachment---------------------------//
    public void revaluationattachmentDelete(Integer sno)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("delete from RevaluationAttach where SNo='" + sno + "'");

            query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }

    }

    public List<RevaluationOfAsset> requiList1(String userId, String orgId, String SNo, String recordStatus)
            throws HibernateException, SQLException {
        List<RevaluationOfAsset> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from RevaluationOfAsset where status!='Inactive' and recordStatus='Request Generated'");

            } else {
                query = session.createQuery("from RevaluationOfAsset where sno='" + SNo + "' and status!='Inactive'");
            }

            datalist = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return datalist;
    }

    //Purchase Requisition Autogenerate
    public List<RevaluationOfAsset> PurchReqAutoGen(String requisitionNo) {
        List<RevaluationOfAsset> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("SELECT revaluation_no FROM revaluation_of_asset where revaluation_no like '%REV%' and STATUS!='Inactive'");

            //System.out.println(query);
            inventory = query.list();
            //System.out.println(inventory);
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }

        return inventory;
    }

    //PR Attachment update
    public void prAttachRecheckUpdate(String sno, String requiNo)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update RevaluationAttach set revaluationNo='" + requiNo + "' where SNo='" + sno + "'");
            query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }

    }

    public List<Class> roleperm(String orgId, String roleName, String submodule, String tab) {
        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from RolePermission where status!='Inactive' and orgId='" + orgId + "' and roleName='" + roleName + "' and submoduleName='" + submodule + "' and tabName='" + tab + "' order by SNO");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    //to fetch requi list in Approval form
    public List<RevaluationOfAsset> requiApprovList(String userId, String orgId, String RequiNo)
            throws HibernateException, SQLException {
        List<RevaluationOfAsset> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from RevaluationOfAsset where status!='Inactive' and SNo='" + RequiNo + "'");
            datalist = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return datalist;
    }

    public List<Class> list(String instanceVariable, String className) {
        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (instanceVariable == "" || instanceVariable == null) {
                query = session.createQuery("from " + className + " where status!='Inactive'");
            } else {
                query = session.createQuery("from " + className + " where status!='Inactive' and SNo='" + instanceVariable + "'");

            }
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    /* view/edit  List */
    public List<RevaluationOfAsset> revaluationOfAsseListView(String sno) {
        List<RevaluationOfAsset> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from RevaluationOfAsset where s_no='" + sno + "' order by s_no asc");
            } else {
                query = session.createQuery("from RevaluationOfAsset order by s_no asc");
            }
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    public void approvUpdate(String prNo, String reviewerRemarks, String recordStatus)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update RevaluationOfAsset set recordStatus='" + recordStatus + "',approvar2Remark='" + reviewerRemarks + "' where revaluationNo='" + prNo + "'");
            query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }

    }

    public List<RevaluationOfAsset> requiList(String userId, String orgId, String SNo, String recordStatus)
            throws HibernateException, SQLException {
        List<RevaluationOfAsset> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from PurchRequisition where status!='Inactive' and recordStatus='Request Generated'");

            } else {
                query = session.createQuery("from PurchRequisition where sno='" + SNo + "' and status!='Inactive'");
            }

            datalist = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return datalist;
    }

    //to fetch requi list in Approval form
    public List<RevaluationOfAsset> requiApprovList1(String userId, String orgId, String RequiNo)
            throws HibernateException, SQLException {
        List<RevaluationOfAsset> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from RevaluationOfAsset where status!='Inactive' and revaluationNo='" + RequiNo + "'");
            datalist = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return datalist;
    }

    public List<UserRegistration> udList(String userId) throws HibernateException, SQLException {
        List<UserRegistration> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from UserRegistration where roleName='" + userId + "' and status!='Inactive'");
            datalist = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return datalist;
    }

    //**************Fetch Requisition Details for Email******************//
    public List<RevaluationOfAsset> tdList(String userId, String orgId, String revaluationNo) throws HibernateException, SQLException {
        List<RevaluationOfAsset> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from RevaluationOfAsset where revaluationNo='" + revaluationNo + "' and status!='Inactive'");
            datalist = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return datalist;
    }

    public List<RevaluationOfAsset> requiList2(String userId, String orgId, String SNo, String recordStatus)
            throws HibernateException, SQLException {
        List<RevaluationOfAsset> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from RevaluationOfAsset where status!='Inactive' and recordStatus='APPROVED 1'");

            } else {
                query = session.createQuery("from RevaluationOfAsset where sno='" + SNo + "' and status!='Inactive'");
            }

            datalist = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return datalist;
    }

    public void approvUpdate1(String prNo, String reviewerRemarks, String recordStatus)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update RevaluationOfAsset set recordStatus='" + recordStatus + "',approvar1Remark='" + reviewerRemarks + "' where revaluationNo='" + prNo + "'");
            query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }

    }

    /*  select the Revaluation Of Asset List from database */
    public List<RevaluationOfAsset> revaluationOfAssetList1() {
        List<RevaluationOfAsset> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from RevaluationOfAsset where status!='Inactive' and (recordStatus='APPROVED 1' or recordStatus='APPROVED 2')");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    public List<RevaluationOfAsset> rejectRequiList1(String userId, String orgId, String SNo, String recordStatus)
            throws HibernateException, SQLException {
        List<RevaluationOfAsset> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from RevaluationOfAsset where status!='Inactive' and recordStatus='REJECTED'");

            } else {
                query = session.createQuery("from RevaluationOfAsset where sno='" + SNo + "' and status!='Inactive'");
            }

            datalist = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return datalist;
    }

    public void reject1Update(String SNo, String reviewerRemarks, String recordStatus)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update RevaluationOfAsset set recordStatus='" + recordStatus + "',approvar1Remark='" + reviewerRemarks + "' where SNo='" + SNo + "'");
            query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }

    }

    public void reject2Update(String SNo, String reviewerRemarks, String recordStatus)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update RevaluationOfAsset set recordStatus='" + recordStatus + "',approvar2Remark='" + reviewerRemarks + "' where SNo='" + SNo + "'");
            query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }

    }


    /*  select the Revaluation Of Asset List from database */
    public List<RevaluationOfAsset> revaluationOfAssetList2() {
        List<RevaluationOfAsset> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from RevaluationOfAsset where status!='Inactive' and recordStatus='APPROVED 2'");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    public void savePayDocument(SplitAssetAttachment document) {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.save(document);
        tx.commit();
        session.close();
    }

    public List<SplitAssetAttachment> attachmentList(String assetCode) {
        List<SplitAssetAttachment> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (assetCode != null) {
                query = session.createQuery("from SplitAssetAttachment where assetCode='" + assetCode + "'  ");
            } else {
                query = session.createQuery("from SplitAssetAttachment");
            }
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    public SplitAssetAttachment getCAMAttach(Integer SNo) {
        Session session = getSessionFactory().openSession();
        SplitAssetAttachment exp = (SplitAssetAttachment) session.get(SplitAssetAttachment.class, SNo);
        session.close();
        return exp;
    }

    public static Map<String, String> fileUpload(MultipartFile multipartFile1, String userId) {
        Map<String, String> fileDetails = new HashMap<String, String>();
        String s = null;
        byte[] document = null;
        String documentName = null;
        File f = new File(dir);
        String path = f.getParent();
        f = new File(path);
        path = f.getParent();
        f = new File(path);

        String extName = null;
        try {
            if (multipartFile1 != null) {
                document = multipartFile1.getBytes();
                documentName = multipartFile1.getOriginalFilename();

                if (documentName.lastIndexOf(".") != -1 && documentName.lastIndexOf(".") != 0) {

                    System.out.println(documentName);
                    extName = documentName.substring(documentName.lastIndexOf(".") + 1);
                    System.out.println("EXTENSION : " + extName);

                }

                int n = (int) (100000 * (Math.random() + Math.random()));
                documentName = Integer.toString(n);

                s = userId + "_" + documentName + "." + extName;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        File folder = new File(f.getPath() + File.separator + "AMS_Attachments");
        boolean b = false;
        String filePath = "";
        try {
            if (!folder.exists()) {
                b = folder.mkdir();
                filePath = folder + File.separator + s;
                File dest = new File(filePath);
                multipartFile1.transferTo(dest);
            } else {
                filePath = folder + File.separator + s;
                File dest = new File(filePath);
                multipartFile1.transferTo(dest);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        fileDetails.put("path", filePath);
        fileDetails.put("newname", s);
        fileDetails.put("oldname", documentName);
        return fileDetails;
    }

    public void saveAssetAttach(List<SplitAssetAttachment> bdpfFile) {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            Iterator<SplitAssetAttachment> itr = bdpfFile.iterator();
            while (itr.hasNext()) {
                SplitAssetAttachment next = itr.next();
                session.saveOrUpdate(next);
            }
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public List<SplitAssetAttachment> assetAttachView(Integer sno, String assetCode) {
        List<SplitAssetAttachment> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from SplitAssetAttachment where assetCode='" + assetCode + "' order by SNo asc");
            } else {
                query = session.createQuery("from SplitAssetAttachment order by SNo asc");
            }
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    public SplitAssetAttachment getattchs(Integer sno) {
        Session session = getSessionFactory().openSession();
        SplitAssetAttachment exp = (SplitAssetAttachment) session.get(SplitAssetAttachment.class, sno);
        session.close();
        return exp;
    }

    public static void delete(String fileName, String filePath) {

        System.out.println("Delete path" + filePath);

        File file = new File(filePath);
        file.delete();
    }

    public void delattachfiles(String classname, String columnname, Integer columnvalue) {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("delete from " + classname + "  where " + columnname + "='" + columnvalue + "'");
            query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void savePayDocument1(RevaluationAttach document) {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.save(document);
        tx.commit();
        session.close();
    }

    public List<RevaluationAttach> attachmentList1(String assetCode) {
        List<RevaluationAttach> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (assetCode != null) {
                query = session.createQuery("from RevaluationAttach where assetCode='" + assetCode + "'  ");
            } else {
                query = session.createQuery("from RevaluationAttach");
            }
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    public RevaluationAttach getRevaluationAttach(Integer SNo) {
        Session session = getSessionFactory().openSession();
        RevaluationAttach exp = (RevaluationAttach) session.get(RevaluationAttach.class, SNo);
        session.close();
        return exp;
    }

    public void saveRevalAttach(List<RevaluationAttach> bdpfFile) {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            Iterator<RevaluationAttach> itr = bdpfFile.iterator();
            while (itr.hasNext()) {
                RevaluationAttach next = itr.next();
                session.saveOrUpdate(next);
            }
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public List<RevaluationAttach> revalAttachView(Integer sno, String assetCode, String revaluationNo) {
        List<RevaluationAttach> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from RevaluationAttach where assetCode='" + assetCode + "' and revaluationNo='" + revaluationNo + "' order by SNo asc");
            } else {
                query = session.createQuery("from RevaluationAttach order by SNo asc");
            }
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    public RevaluationAttach getattchs1(Integer sno) {
        Session session = getSessionFactory().openSession();
        RevaluationAttach exp = (RevaluationAttach) session.get(RevaluationAttach.class, sno);
        session.close();
        return exp;
    }

}
