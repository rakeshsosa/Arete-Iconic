/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.dao;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
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
import tenant.classes.AccessoryType;
import tenant.classes.AreaManagement;
import tenant.classes.AreaManagementGrid;
import tenant.classes.AssetAttach;
import tenant.classes.AssetDetails;
import tenant.classes.AssetUtilityDetails;
import tenant.classes.BookingTenantDetails;
import tenant.classes.BookingTenantUtilityDetails;
import tenant.classes.BuildingHistoryManagement;
import tenant.classes.BuildingHistoryManagementGrid;
import tenant.classes.ComplaintType;
import tenant.classes.DocumentAttach;
import tenant.classes.FlatRoomDetails;
import tenant.classes.IndividualUitlity;
import tenant.classes.StoreMaster;
import tenant.classes.SubAssetAttach;
import tenant.classes.SubAssetDetails;
import tenant.classes.TenantServicesGrid;
import tenant.classes.TenantUtilityDetails;
import tenant.classes.VendorDetails;
import tenant.classes.assetOwnerItem;

/**
 *
 * @author ebs-sdd32
 */
public class AssetDAO extends HibernateDaoSupport {

    private AssetDAO assetDao;
    private static final String dir = System.getProperty("user.dir");

    //---------------Property Details---------------------------//
    //**************Property Details List******************//
    public List<AssetDetails> AssetDetailslist(String sno) {
        List<AssetDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from AssetDetails where status!='Inactive' and SNo='" + sno + "'");
            } else {
                query = session.createQuery("from AssetDetails");  //where status!='Inactive'ssssss
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

    public List<AreaManagement> AreaManagementlist(String sno) {
        List<AreaManagement> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from AreaManagement where status!='Inactive' and sno='" + sno + "'");
            } else {
                query = session.createSQLQuery("select distinct area_code,asset_code,asset_name,s_no,status from arete_tms.area_management");
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

    public List<AreaManagement> AreaCodelist(String areaCode) {
        List<AreaManagement> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (areaCode != null) {
                query = session.createQuery("from AreaManagement where status!='Inactive' and areaCode='" + areaCode + "'");
            } else {
                query = session.createSQLQuery("select distinct area_code,asset_code,asset_name from arete_tms.area_management");
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

    //newly added by lakshmi for dashboard based on from and to dates
    public List<AssetDetails> AssetDetailslist1(String fromDate, String toDate) {
        List<AssetDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (fromDate != null && toDate != null) {
                query = session.createQuery("from AssetDetails where status!='Inactive' and lastmodified_date >='" + fromDate + "' and lastmodified_date <='" + toDate + "'");
            } else {
                query = session.createQuery("from AssetDetails");  // where status!='Inactive'
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

    public List<TenantUtilityDetails> tenantUtilityDetailslist(String assetCode, String contractPeriod) {
        List<TenantUtilityDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (assetCode != null) {
                query = session.createQuery("from TenantUtilityDetails where status!='Inactive' and assetCode='" + assetCode + "' and contractPeriod='" + contractPeriod + "'");
            } else {
                query = session.createQuery("from TenantUtilityDetails where status!='Inactive'");
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

    ///newly added by lakshmi
    public List<BookingTenantUtilityDetails> bookingTenantUtilityDetailslist(String assetCode, String tenantcode) {
        List<BookingTenantUtilityDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (assetCode != null) {
                query = session.createQuery("from BookingTenantUtilityDetails where status!='Inactive' and assetCode='" + assetCode + "' and tenantCode='" + tenantcode + "'");
            } else {
                query = session.createQuery("from BookingTenantUtilityDetails where status!='Inactive'");
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
    
     public List<BookingTenantDetails> bookingTenantDetailslist(String assetName, String tenantcode) {
        List<BookingTenantDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (assetName != null) {
                query = session.createQuery("from BookingTenantDetails where status!='Inactive' and assetName='" + assetName + "' and tenantCode='" + tenantcode + "'");
            } else {
                query = session.createQuery("from BookingTenantDetails where status!='Inactive'");
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
     
     																			
public List<BookingTenantUtilityDetails> bookingTenantUtilityDetailslist1(String assetName, String tenantcode) {
        List<BookingTenantUtilityDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (assetName != null) {
                query = session.createQuery("from BookingTenantUtilityDetails where status!='Inactive' and assetName='" + assetName + "' and tenantCode='" + tenantcode + "'");
            } else {
                query = session.createQuery("from BookingTenantUtilityDetails where status!='Inactive'");
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

    ///////
    public List<AssetUtilityDetails> AssetUtilityDetailslist(String assetCode) {
        List<AssetUtilityDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (assetCode != null) {
                query = session.createQuery("from AssetUtilityDetails where status!='Inactive' and assetCode='" + assetCode + "'");
            } else {
                query = session.createQuery("from AssetUtilityDetails where status!='Inactive'");
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
     public List<AssetUtilityDetails> AssetUtilityDetailslist1(String assetCode) {
        List<AssetUtilityDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (assetCode != null) {
                query = session.createQuery("from AssetUtilityDetails where status!='Inactive' and assetCode='" + assetCode + "'");
            } else {
                query = session.createQuery("from AssetUtilityDetails where status!='Inactive'");
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

    public List<TenantUtilityDetails> documentsTrackingDetailslist(String assetCode) {
        List<TenantUtilityDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (assetCode != null) {
                query = session.createQuery("from documentsTrackingDetailslist where status!='Inactive' and assetCode='" + assetCode + "'");
            } else {
                query = session.createQuery("from documentsTrackingDetailslist where status!='Inactive'");
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

//**************for MIn rent Generation******************//
    public void minRentGen(HttpServletRequest req, HttpServletResponse res, String assetCode) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<SubAssetDetails> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select sum(minimum_rent_fixed) from arete_tms.sub_asset_details where asset_code='" + assetCode + "'");
            citydata = query.list();
            if (citydata.isEmpty() || citydata.contains(null)) {
                out.append("a");
            } else {
                out.append(citydata.toString());
            }
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("exception");
        } finally {
            session.close();
        }
    }

    public List<ComplaintType> complaintType() throws HibernateException, SQLException {
        List<ComplaintType> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT complaint_type FROM arete_tms.complaint_type WHERE status!='Inactive' ORDER BY complaint_type ASC");
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

    //**************For Auto Generation of Property Code******************//
    public List<AssetDetails> getAssetNo(String assetName) {
        List<AssetDetails> code = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (assetName != null) {
                query = session.createSQLQuery("SELECT asset_code FROM arete_tms.asset_details where asset_code like '%PROPERTY%' ORDER BY s_no ASC");
            } else {
                query = session.createQuery("from AssetDetails where  status!='Inactive' ORDER BY lastmodifiedDate DESC");
            }
            code = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }

        return code;
    }

    //**************For Auto Generation of Property Code******************//
    public List<AssetDetails> getAreaCode(String assetName) {
        List<AssetDetails> code = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (assetName != null) {
                query = session.createSQLQuery("SELECT area_code FROM arete_tms.asset_details where area_code like '%Area%' ORDER BY s_no ASC");
            } else {
                query = session.createQuery("from AssetDetails where  status!='Inactive' ORDER BY lastmodifiedDate DESC");
            }
            code = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }

        return code;
    }

    //**************To Restrict Properties******************//
    public Integer countAsset() throws HibernateException, SQLException {
        List<AssetDetails> datalist = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        Integer tsno = null;
        try {
            query = session.createQuery("from AssetDetails order by SNo DESC");
            query.setMaxResults(1);
            datalist = query.list();
            if (datalist.size() == 0) {
                tsno = 0;
            } else {
                AssetDetails tc = datalist.get(0);
                tsno = tc.getSNo();
            }
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tsno;
    }
//**************To Save Property******************//

    public void assetSave(List<AssetUtilityDetails> grid) throws HibernateException, SQLException {

        for (Iterator<AssetUtilityDetails> iterator = grid.iterator(); iterator.hasNext();) {

            AssetUtilityDetails test = (AssetUtilityDetails) iterator.next();
            assetUtilitySave(test);
        }
    }

    public void tenantSave(List<TenantUtilityDetails> grid) throws HibernateException, SQLException {

        for (Iterator<TenantUtilityDetails> iterator = grid.iterator(); iterator.hasNext();) {

            TenantUtilityDetails test = (TenantUtilityDetails) iterator.next();
            tenantUtilitySave(test);
        }
    }

    public void tenantUtilitySave(TenantUtilityDetails transientInstance) {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(transientInstance);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }

    //////Newly added By Lakshmi/////
    public void bookingTenantUtilitySave(BookingTenantUtilityDetails transientInstance) {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(transientInstance);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }

    public void bookingTenantSave(List<BookingTenantUtilityDetails> grid) throws HibernateException, SQLException {

        for (Iterator<BookingTenantUtilityDetails> iterator = grid.iterator(); iterator.hasNext();) {

            BookingTenantUtilityDetails test1 = (BookingTenantUtilityDetails) iterator.next();
            bookingTenantUtilitySave(test1);
        }
    }

    //////////////////////
    public void assetUtilitySave(AssetUtilityDetails transientInstance) {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(transientInstance);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }

    public void assetSave(AssetDetails transientInstance) {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(transientInstance);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }

    public void areaSave(AreaManagement transientInstance) {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(transientInstance);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }
//**************To Fetch Property Attach******************//

//    public AssetAttach getAssetAttach(Integer id) {
//        Session session = getSessionFactory().openSession();
//        AssetAttach exp = (AssetAttach) session.get(AssetAttach.class, id);
//        session.close();
//        return exp;
//    }
    //---------------Floor Details List---------------------------//
    public List<SubAssetDetails> subAssetDetailslist(String sno) {
        List<SubAssetDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from SubAssetDetails where status!='Inactive' and SNo='" + sno + "'");
            } else {
                query = session.createQuery("select ad.assetCode,ad.assetName,sad.SNo,sad.subAssetCode,sad.subAssetName,sad.recordStatus,sad.status from AssetDetails ad, SubAssetDetails sad where ad.assetCode=sad.assetCode");

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
    
    public List<SubAssetDetails> subRentQuotetDetailslist(String sno) {
        List<SubAssetDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from SubAssetDetails where status!='Inactive' and SNo='" + sno + "'");
            } else {
                query = session.createQuery("select ad.assetCode,ad.assetName,sad.SNo,sad.subAssetCode,sad.subAssetName,sad.recordStatus ,sad.floor from AssetDetails ad, SubAssetDetails sad where ad.assetCode=sad.assetCode");

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

    public List<SubAssetDetails> selectUnitNumbersDetailslist(String sno) {
        List<SubAssetDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from SubAssetDetails where status!='Inactive' and SNo='" + sno + "'");
            } else {
                query = session.createQuery("from SubAssetDetails");

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

    public List<SubAssetDetails> subAssetDetailsUpdate(String sno) {
        List<SubAssetDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("select ad.assetCode,ad.assetName,sad.SNo,sad.subAssetCode,sad.subAssetName,sad.recordStatus from AssetDetails ad, SubAssetDetails sad where ad.assetCode=sad.assetCode and ad.assetName='" + sno + "'");
            } else {
                query = session.createQuery("select ad.assetCode,ad.assetName,sad.SNo,sad.subAssetCode,sad.subAssetName,sad.recordStatus from AssetDetails ad, SubAssetDetails sad where ad.assetCode=sad.assetCode");

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

    public List<SubAssetDetails> propertyWiseilst(String sno) {
        List<SubAssetDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from SubAssetDetails where status!='Inactive' and SNo='" + sno + "'");
            } else {
                query = session.createQuery("select distinct ad.assetName from AssetDetails ad, SubAssetDetails sad where ad.assetCode=sad.assetCode");

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

    public List<StoreMaster> selectStoreName()
            throws HibernateException, SQLException {
        List<StoreMaster> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from StoreMaster where status!='Inactive'");

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

    //---------------Vacate Floor Details List---------------------------//
    public List<SubAssetDetails> subAssetVacateDetailslist(String vacant) {
        List<SubAssetDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("select ad.assetCode,ad.assetName,sad.SNo,sad.subAssetCode,sad.subAssetName,sad.recordStatus,sad.status from AssetDetails ad, SubAssetDetails sad where ad.assetCode=sad.assetCode and sad.recordStatus='" + vacant + "'");

            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    ///newly added by lakshmi for dashboard based on from and to dates 
    public List<SubAssetDetails> subAssetVacateDetailslist1(String vacant, String fromDate, String toDate) {
        List<SubAssetDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (fromDate != "" && fromDate != null && toDate != "" && toDate != null && vacant != "" && vacant != null) {
                query = session.createQuery("select ad.assetCode,ad.assetName,sad.SNo,sad.subAssetCode,sad.subAssetName,sad.recordStatus from AssetDetails ad, SubAssetDetails sad where ad.assetCode=sad.assetCode and sad.recordStatus='" + vacant + "' and sad.lastmodifiedDate >='" + fromDate + "' and sad.lastmodifiedDate <='" + toDate + "'");
            } else {
                query = session.createQuery("select ad.assetCode,ad.assetName,sad.SNo,sad.subAssetCode,sad.subAssetName,sad.recordStatus from AssetDetails ad, SubAssetDetails sad where ad.assetCode=sad.assetCode and sad.lastmodifiedDate >='" + fromDate + "' and sad.lastmodifiedDate <='" + toDate + "'");
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

    //---------------Vacate Floor Details List---------------------------//
    public List<SubAssetDetails> subAssetStatusDetailslist(String vacant, String propName, String fromDate, String toDate) {
        List<SubAssetDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (vacant != null) {
                if (propName != "" && propName != null) {
                    if (vacant != "Inactive") {
                        query = session.createQuery("select ad.assetCode,ad.assetName,sad.SNo,sad.subAssetCode,sad.subAssetName,sad.recordStatus from AssetDetails ad, SubAssetDetails sad where ad.assetCode=sad.assetCode and sad.recordStatus='" + vacant + "' and sad.assetName='" + propName + "' and sad.lastmodifiedDate >='" + fromDate + "' and sad.lastmodifiedDate <='" + toDate + "'");
                    } else if (vacant == "Inactive") {
                        query = session.createQuery("select ad.assetCode,ad.assetName,sad.SNo,sad.subAssetCode,sad.subAssetName,sad.recordStatus from AssetDetails ad, SubAssetDetails sad where ad.assetCode=sad.assetCode and sad.status='" + vacant + "' and sad.assetName='" + propName + "' and sad.lastmodifiedDate >='" + fromDate + "' and sad.lastmodifiedDate <='" + toDate + "'");
                    }
                } else {
                    if (vacant != "Inactive") {
                        query = session.createQuery("select ad.assetCode,ad.assetName,sad.SNo,sad.subAssetCode,sad.subAssetName,sad.recordStatus from AssetDetails ad, SubAssetDetails sad where ad.assetCode=sad.assetCode and sad.recordStatus='" + vacant + "'");
                    } else if (vacant == "Inactive") {
                        query = session.createQuery("select ad.assetCode,ad.assetName,sad.SNo,sad.subAssetCode,sad.subAssetName,sad.recordStatus from AssetDetails ad, SubAssetDetails sad where ad.assetCode=sad.assetCode and sad.status='" + vacant + "'");
                    }
                }
            } else {
                if (propName != "" && propName != null) {
                    query = session.createQuery("select ad.assetCode,ad.assetName,sad.SNo,sad.subAssetCode,sad.subAssetName,sad.recordStatus from AssetDetails ad, SubAssetDetails sad where ad.assetCode=sad.assetCode and sad.assetName='" + propName + "' and sad.assetName='" + propName + "' and sad.lastmodifiedDate >='" + fromDate + "' and sad.lastmodifiedDate <='" + toDate + "'");
                } else {
                    query = session.createQuery("select ad.assetCode,ad.assetName,sad.SNo,sad.subAssetCode,sad.subAssetName,sad.recordStatus from AssetDetails ad, SubAssetDetails sad where ad.assetCode=sad.assetCode");
                }

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

    public List<SubAssetDetails> subAssetStatusGrapDetailslist(String vacant) {
        List<SubAssetDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (vacant != "Inactive") {
                query = session.createQuery("select ad.assetCode,ad.assetName,sad.SNo,sad.subAssetCode,sad.subAssetName,sad.recordStatus from AssetDetails ad, SubAssetDetails sad where ad.assetCode=sad.assetCode and sad.recordStatus='" + vacant + "'");
            } else if (vacant == "Inactive") {
                query = session.createQuery("select ad.assetCode,ad.assetName,sad.SNo,sad.subAssetCode,sad.subAssetName,sad.recordStatus from AssetDetails ad, SubAssetDetails sad where ad.assetCode=sad.assetCode and sad.status='" + vacant + "'");
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

    public List<FlatRoomDetails> flatRoomDetailslist(String vacant) {
        List<FlatRoomDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("select ad.assetCode,ad.assetName,sad.subAssetCode,sad.subAssetName,fr.recordStatus, fr.roomName, fr.roomCode, fr.SNo from AssetDetails ad, SubAssetDetails sad, FlatRoomDetails fr where ad.assetCode=sad.assetCode and fr.subAssetCode=sad.subAssetCode");

            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    public List<FlatRoomDetails> flatRoomDetails(Integer sno) {
        List<FlatRoomDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("from FlatRoomDetails  where SNo='" + sno + "'");

            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
//--------------- To Fetch Property Name---------------------------//

    public List<AssetDetails> AssetName(String assetCode) {
        List<AssetDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (assetCode != null) {
                query = session.createQuery("from AssetDetails where status!='Inactive' and assetCode='" + assetCode + "'");
            } else {
                query = session.createQuery("from AssetDetails where status!='Inactive'");
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
//--------------- To Fetch Floor Details---------------------------//

    public List<SubAssetDetails> subAssetDetailslist1(String subAssetCode) {
        List<SubAssetDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (subAssetCode != null) {
                query = session.createQuery("from SubAssetDetails where status!='Inactive' and subAssetCode='" + subAssetCode + "'");
            } else {
                query = session.createQuery("from SubAssetDetails where status!='Inactive'");
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
//--------------- To Fetch Property Details---------------------------//

    public List<AssetDetails> selectAssetDetails()
            throws HibernateException, SQLException {
        List<AssetDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from AssetDetails where status!='Inactive'");

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

    public List<AssetDetails> selectAssetAreaDetails()
            throws HibernateException, SQLException {
        List<AssetDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct ad.asset_code,ad.asset_name,ad.asset_area,ad.no_of_floors,ad.area_code from \n"
                    + "arete_tms.asset_details ad where area_status is not null or area_status=''");

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
//--------------- To get Auto Generation Code of Floor ---------------------------//

    public Integer getSubAssetNo() throws HibernateException, SQLException {
        List<SubAssetDetails> datalist = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        Integer tsno = null;
        try {
            query = session.createQuery("from SubAssetDetails order by SNo DESC");
            query.setMaxResults(1);
            datalist = query.list();
            if (datalist.size() == 0) {
                tsno = 0;
            } else {
                SubAssetDetails tc = datalist.get(0);
                tsno = tc.getSNo();
            }
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tsno;
    }

    public Integer getRoomCode() throws HibernateException, SQLException {
        List<FlatRoomDetails> datalist = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        Integer tsno = null;
        try {
            query = session.createQuery("from FlatRoomDetails order by SNo DESC");
            query.setMaxResults(1);
            datalist = query.list();
            if (datalist.size() == 0) {
                tsno = 0;
            } else {
                FlatRoomDetails tc = datalist.get(0);
                tsno = tc.getSNo();
            }
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tsno;
    }
//--------------- To save Floor Details---------------------------//

    public void saveSubAssetDetails(List<SubAssetDetails> grid) throws HibernateException, SQLException {

        for (Iterator<SubAssetDetails> iterator = grid.iterator(); iterator.hasNext();) {

            SubAssetDetails test = (SubAssetDetails) iterator.next();
            subAssetSave(test);
        }

            }

    public void saveFlatRoomDetails(List<FlatRoomDetails> grid) throws HibernateException, SQLException {

        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            for (Iterator<FlatRoomDetails> iterator = grid.iterator(); iterator.hasNext();) {

                FlatRoomDetails test = (FlatRoomDetails) iterator.next();
                session.saveOrUpdate(test);

            }
            tx.commit();

        } catch (Exception ex) {
            if (null != tx) {
                tx.rollback();
            }
            ex.printStackTrace();
        } finally {
            session.close();
        }

    }
//--------------- To save Floor Details---------------------------//

    public void subAssetSave(SubAssetDetails transientInstance) {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(transientInstance);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }
//--------------- To get AccessoriesTagging Details---------------------------//

    public List<AccessoriesTagging> accessoriesDetailsList(String sno) {
        List<AccessoriesTagging> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from AccessoriesTagging where status!='Inactive' and SNo='" + sno + "'");
            } else {
                // query = session.createQuery("from AccessoriesTagging where status!='Inactive'");
                query = session.createQuery("select ad.assetCode,ad.assetName,sad.SNo,sad.subAssetCode,sad.subAssetName from AssetDetails ad, SubAssetDetails sad, AccessoriesTagging at where ad.assetCode=at.assetCode and sad.subAssetCode=at.subAssetCode group by sad.subAssetCode");
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
//--------------- To get Floor Details---------------------------//

    public List<SubAssetDetails> selectSubAssetDetails(String assetCode)
            throws HibernateException, SQLException {
        List<SubAssetDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            //query = session.createQuery("from SubAssetDetails where status!='Inactive'");
            query = session.createQuery("from SubAssetDetails where assetCode='" + assetCode + "'");
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
//--------------- To save AccessoriesTagging Details---------------------------//

    public void saveAccessoryDetails(List<AccessoriesTagging> grid) throws HibernateException, SQLException {

        for (Iterator<AccessoriesTagging> iterator = grid.iterator(); iterator.hasNext();) {

            AccessoriesTagging test = (AccessoriesTagging) iterator.next();
            accessoriesSave(test);
        }

    }
//--------------- To save AccessoriesTagging Details---------------------------//

    public void accessoriesSave(AccessoriesTagging transientInstance) {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(transientInstance);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }
//--------------- To save Floor Details Attach---------------------------//

    public void subAssetAttachSave(SubAssetAttach document) {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();

        session.save(document);
        tx.commit();
        session.close();
    }
//--------------- To Fetch AccessoriesTagging Details---------------------------//

    public List<AccessoriesTagging> AccessoryDetailslist(String subAssetCode) {
        List<AccessoriesTagging> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (subAssetCode != null) {
                // query = session.createQuery("from AccessoriesTagging where status!='Inactive' and SNo='" + sno + "'");
                query = session.createQuery("select act.itemCode,act.itemName,act.itemCategory,at.SNo,at.remarks,at.quantity from ItemMaster act, AccessoriesTagging at where at.subAssetCode='" + subAssetCode + "' and at.accessoryCode=act.itemCode");
            } else {
                // query = session.createQuery("from AccessoriesTagging where status!='Inactive'");
                query = session.createQuery("select ad.assetCode,ad.assetName,sad.subAssetCode,sad.subAssetName from AssetDetails ad, SubAssetDetails sad where ad.assetCode=sad.assetCode");

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
//--------------- To Fetch Property Details---------------------------//

    public List<AssetDetails> AccessoryDetailslist1(String assetCode) {
        List<AssetDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (assetCode != null) {
                query = session.createQuery("from AssetDetails where status!='Inactive' and assetCode='" + assetCode + "'");
            } else {
                query = session.createQuery("from AccessoriesTagging where status!='Inactive'");
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
//--------------- To Fetch AccessoriesTagging Details---------------------------//

    public List<AccessoriesTagging> AccessoryDetailslist2(String subAssetCode) {
        List<AccessoriesTagging> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (subAssetCode != null) {
                query = session.createQuery("from AccessoriesTagging where status!='Inactive' and subAssetCode='" + subAssetCode + "'");
            } else {
                query = session.createQuery("from AccessoriesTagging where status!='Inactive'");
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
//--------------- To Fetch Floor Details---------------------------//

    public List<SubAssetDetails> AccessoryDetailslist3(String subAssetCode) {
        List<SubAssetDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (subAssetCode != null) {
                query = session.createQuery("from SubAssetDetails where status!='Inactive' and subAssetCode='" + subAssetCode + "'");
            } else {
                query = session.createQuery("from AccessoriesTagging where status!='Inactive'");
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
//--------------- To Fetch Floor Details Attachment---------------------------//

    public List<SubAssetAttach> subAssetAttachlist(String subAssetCode) {
        List<SubAssetAttach> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from SubAssetAttach where subAssetCode='" + subAssetCode + "'");

            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
//--------------- To download Floor Details Attachment---------------------------//

    public SubAssetAttach getSubAssetAttach(Integer id) {
        Session session = getSessionFactory().openSession();
        SubAssetAttach exp = (SubAssetAttach) session.get(SubAssetAttach.class, id);
        session.close();
        return exp;
    }

//--------------- To fetch Floor Details Attachment---------------------------//
    public List<SubAssetAttach> subAssetDocuments(String subAssetCode) {
        List<SubAssetAttach> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from SubAssetAttach where subAssetCode='" + subAssetCode + "' and status!='Inactive'");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

//--------------- To fetch Property Details Attachment---------------------------//
    public List<AssetAttach> assetDocuments(String assetCode) {
        List<AssetAttach> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from AssetAttach where assetCode='" + assetCode + "' and status!='Inactive'");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
//--------------- To save Floor Details Attachment---------------------------//

//    public void subAssetDocumentsSave(SubAssetAttach transientInstance) {
//        Session session = getSessionFactory().openSession();
//        try {
//            Transaction tx = session.beginTransaction();
//            session.save(transientInstance);
//            tx.commit();
//        } catch (Exception e) {
//            e.printStackTrace();
//            session.close();
//
//        } finally {
//            session.clear();
//            session.close();
//        }
//    }
//--------------- To save Floor Details Attachment---------------------------//
    public void subAssetDocumentsSave(List<SubAssetAttach> bdpfFile) {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            Iterator<SubAssetAttach> itr = bdpfFile.iterator();
            while (itr.hasNext()) {
                SubAssetAttach next = itr.next();
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

//    public void docSave(List<SubAssetAttach> grid) throws HibernateException, SQLException {
//        for (Iterator<SubAssetAttach> iterator = grid.iterator(); iterator.hasNext();) {
//            SubAssetAttach sales = (SubAssetAttach) iterator.next();
//            subAssetDocumentsSave(sales);
//        }
//    }
//--------------- To save Property Details Attachment---------------------------//
    public void assetDocumentsSave(AssetAttach transientInstance) {
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
//--------------- To save Property Details Attachment---------------------------//

    public void assetDocSave(List<AssetAttach> grid) throws HibernateException, SQLException {
        for (Iterator<AssetAttach> iterator = grid.iterator(); iterator.hasNext();) {
            AssetAttach sales = (AssetAttach) iterator.next();
            assetDocumentsSave(sales);
        }
    }
//--------------- To delete Floor Details Attachment---------------------------//

    public void subAssetattachmentDelete(Integer sno)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("delete from SubAssetAttach where SNo='" + sno + "'");

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
//--------------- To delete Property Details Attachment---------------------------//

    public void assetattachmentDelete(Integer sno)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("delete from AssetAttach where SNo='" + sno + "'");

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

//--------------- To fetch Accessories---------------------------//
    public List<AccessoryType> selectAccessoryDetails()
            throws HibernateException, SQLException {
        List<AccessoryType> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            //  query = session.createQuery("select acc.accessoryCode,acc.accessoryName,acc.accessoryDesc from AccessoryType acc, AccessoriesTagging acct where acct.accessoryCode!=acc.accessoryCode and acct.subAssetCode='"+subAssetCode +"' order by acc.SNo DESC");
            query = session.createQuery("from ItemMaster where status!='Inactive'");

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

//--------------- To delete Grid data of Accessories Tagging---------------------------//
    public void accessoryGridDataDelete(Integer sno)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("delete from AccessoriesTagging where SNo='" + sno + "'");

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

//--------------- To validate duplicacy of Accessories in Accessories Tagging---------------------------//
    public void accessoriesCheckn(HttpServletRequest req, HttpServletResponse res, String accessoryCode, String subAssetCode) throws HibernateException, SQLException, IOException {

        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        List<AccessoriesTagging> accessories = null;
        StringBuffer result = new StringBuffer();
        String s = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from AccessoriesTagging where accessoryCode='" + accessoryCode + "' and subAssetCode='" + subAssetCode + "' ");
            accessories = query.list();

            if (accessories.isEmpty()) {
                s = "Data  available";
            } else {
                s = "Data not available";
            }
            out.append(s);

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

//--------------- To validate duplicacy of Floor Name---------------------------//
    public void subAssetNameCheckn(HttpServletRequest req, HttpServletResponse res, String subAssetName, String assetCode) throws HibernateException, SQLException, IOException {

        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        List<SubAssetDetails> subName = null;
        StringBuffer result = new StringBuffer();
        String s = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from SubAssetDetails where subAssetName='" + subAssetName + "' and assetCode='" + assetCode + "' ");
            subName = query.list();

            if (subName.isEmpty()) {
                s = "Data  available";
            } else {
                s = "Data not available";
            }
            out.append(s);

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

    public void saveAssetAttach(List<AssetAttach> bdpfFile) {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            Iterator<AssetAttach> itr = bdpfFile.iterator();
            while (itr.hasNext()) {
                AssetAttach next = itr.next();
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

    public void saveAssetOwner(List<assetOwnerItem> bdpfFile) {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            Iterator<assetOwnerItem> itr = bdpfFile.iterator();
            while (itr.hasNext()) {
                assetOwnerItem next = itr.next();
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

    public void saveDocumentAttach(List<DocumentAttach> bdpfFile) {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            Iterator<DocumentAttach> itr = bdpfFile.iterator();
            while (itr.hasNext()) {
                DocumentAttach next = itr.next();
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

    public void savePayDocument(AssetAttach document) {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.save(document);
        tx.commit();
        session.close();
    }

    public List<AssetAttach> attachmentList(String assetCode) {
        List<AssetAttach> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (assetCode != null) {
                query = session.createQuery("from AssetAttach where assetCode='" + assetCode + "'  ");
            } else {
                query = session.createQuery("from AssetAttach");
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

    public AssetAttach getAssetAttach(Integer SNo) {
        Session session = getSessionFactory().openSession();
        AssetAttach exp = (AssetAttach) session.get(AssetAttach.class, SNo);
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

    public List<AssetAttach> assetAttachView(Integer sno, String assetCode) {
        List<AssetAttach> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (assetCode != null) {
                query = session.createQuery("from AssetAttach where assetCode='" + assetCode + "' order by SNo asc");
            } else {
                query = session.createQuery("from AssetAttach order by SNo asc");
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

    public List<assetOwnerItem> assetOwnerView(Integer sno, String assetCode) {
        List<assetOwnerItem> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (assetCode != null) {
                query = session.createQuery("from assetOwnerItem where assetCode='" + assetCode + "' order by SNo asc");
            } else {
                query = session.createQuery("from assetOwnerItem order by SNo asc");
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

    public List<DocumentAttach> documentAttachView(String sno, String assetCode) {
        List<DocumentAttach> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from DocumentAttach where SNo='" + sno + "' order by SNo asc");
            } else {
                query = session.createQuery("from DocumentAttach order by SNo asc");
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

    public AssetAttach getattchs(Integer sno) {
        Session session = getSessionFactory().openSession();
        AssetAttach exp = (AssetAttach) session.get(AssetAttach.class, sno);
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

    public void savePayDocument1(SubAssetAttach document) {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.save(document);
        tx.commit();
        session.close();
    }

    public List<SubAssetAttach> attachmentList1(String assetCode) {
        List<SubAssetAttach> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (assetCode != null) {
                query = session.createQuery("from SubAssetAttach where assetCode='" + assetCode + "'  ");
            } else {
                query = session.createQuery("from SubAssetAttach");
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

    public SubAssetAttach getCAMAttach(Integer SNo) {
        Session session = getSessionFactory().openSession();
        SubAssetAttach exp = (SubAssetAttach) session.get(SubAssetAttach.class, SNo);
        session.close();
        return exp;
    }

    public static Map<String, String> fileUpload1(MultipartFile multipartFile1, String userId) {
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

    public void saveAssetAttach1(List<SubAssetAttach> bdpfFile) {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            Iterator<SubAssetAttach> itr = bdpfFile.iterator();
            while (itr.hasNext()) {
                SubAssetAttach next = itr.next();
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

    public List<SubAssetAttach> assetAttachView1(Integer sno, String assetCode, String subAssetCode) {
        List<SubAssetAttach> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from SubAssetAttach where assetCode='" + assetCode + "' and subAssetCode='" + subAssetCode + "' group by filename order by SNo asc");
            } else {
                query = session.createQuery("from SubAssetAttach group by filename order by SNo asc");
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

    public SubAssetAttach getattchs1(Integer sno) {
        Session session = getSessionFactory().openSession();
        SubAssetAttach exp = (SubAssetAttach) session.get(SubAssetAttach.class, sno);
        session.close();
        return exp;
    }

    public static void delete1(String fileName, String filePath) {

        System.out.println("Delete path" + filePath);

        File file = new File(filePath);
        file.delete();
    }

    public void delattachfiles1(String classname, String columnname, Integer columnvalue) {
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

    public void fetchRentalUtilityName(HttpServletRequest req, HttpServletResponse res, String utliCode, String utilityCategory) throws HibernateException, SQLException, IOException {
        List<IndividualUitlity> datalist = null;
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            if (utilityCategory.equalsIgnoreCase("Individual Utility")) {

                query = session.createSQLQuery("select utility,remarks from arete_tms.individual_utility where utility_code='" + utliCode + "' and status!='Inactive'");
            } else {

                query = session.createSQLQuery("select comUtility,remarks from arete_tms.common_comutility where comutility_code='" + utliCode + "'  \n"
                        + " and status!='Inactive'");
            }

            List<Object[]> cityData = query.list();
            System.out.println("Else If Licen:" + query);
            if (cityData.isEmpty()) {
                out.append("No Data");
            } else {

                List<Object[]> itr = query.list();

                for (Object[] st : itr) {

                    for (int i = 0; i < st.length; i++) {
                        String s = st[i].toString().trim();
                        if (s.length() > 0) {
                            out.append(s.trim() + ",,,");
                        }
                    }
                }
                // out.append(datalist.toString());
                //  out.append((CharSequence) itr);
            }

            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("exception");
        } finally {
            session.close();
        }
    }

    public void fetchComUtilityName(HttpServletRequest req, HttpServletResponse res, String utliCode) throws HibernateException, SQLException, IOException {
        List<IndividualUitlity> datalist = null;
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("select comutility,remarks from arete_tms.common_comutility where comutility_code='" + utliCode + "' and status!='Inactive'");

            List<Object[]> cityData = query.list();
            System.out.println("Else If Licen:" + query);
            if (cityData.isEmpty()) {
                out.append("No Data");
            } else {

                List<Object[]> itr = query.list();

                for (Object[] st : itr) {

                    for (int i = 0; i < st.length; i++) {
                        String s = st[i].toString().trim();
                        if (s.length() > 0) {
                            out.append(s.trim() + ",,,");
                        }
                    }
                }
                // out.append(datalist.toString());
                //  out.append((CharSequence) itr);
            }

            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("exception");
        } finally {
            session.close();
        }
    }

    public List<AssetUtilityDetails> utlitiesTaggingList(String assetCode, String userId, String sno) {
        List<AssetUtilityDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from AssetUtilityDetails where SNo='" + sno + "'");
            } else {
                query = session.createSQLQuery("select distinct asset_code,asset_name,lastmodified_date,s_no,status utility from arete_tms.asset_utility_details");
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
    
     
    public void buildingSave(List<BuildingHistoryManagement> grid) throws HibernateException, SQLException {

        for (Iterator<BuildingHistoryManagement> iterator = grid.iterator(); iterator.hasNext();) {

            BuildingHistoryManagement test = (BuildingHistoryManagement) iterator.next();
            asseBuildingSave(test);
        }
    }
    
    public void asseBuildingSave(BuildingHistoryManagement transientInstance) {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(transientInstance);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }
    
    public void updateStausAreaManagement(String assetCode,String userId) {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {

            String hql = "update arete_tms.asset_details  set area_status='areaCompleted' where  asset_code='" + assetCode + "' and status!='Inactive'";
            Query query = session.createSQLQuery(hql);
            int row = query.executeUpdate();

        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {

        }
        tx.commit();
        session.close();
    }

    
    public List<BuildingHistoryManagement> buildingHistorylist(String sno) {
        List<BuildingHistoryManagement> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from BuildingHistoryManagement where status!='Inactive' and sno='" + sno + "'");
            } else {
                query = session.createQuery("from BuildingHistoryManagement where status!='Inactive'");
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
    
    public void assetDetailsDel(String SNo, String status) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = null;
        try {
            if (status.equals("Active") || status.equals("Update0")) {
                hql = "update AssetDetails set status='Inactive' where SNo='" + SNo + "'";
            } else {
                hql = "update AssetDetails set status='Active' where SNo='" + SNo + "'";
            }
            Query query = session.createQuery(hql);
            int row = query.executeUpdate();
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        tx.commit();
        session.close();
    }
    public void areaDetailsDel(String SNo, String status) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = null;
        try {
            if (status.equals("Active") || status.equals("Update0")) {
                hql = "update AreaManagement set status='Inactive' where sno='" + SNo + "'";
            } else {
                hql = "update AreaManagement set status='Active' where sno='" + SNo + "'";
            }
            Query query = session.createQuery(hql);
            int row = query.executeUpdate();
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        tx.commit();
        session.close();
    }
    public void utilityDetailsDel(String SNo, String status) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = null;
        try {
            if (status.equals("Active") || status.equals("Update0")) {
                hql = "update AssetUtilityDetails set status='Inactive' where SNo='" + SNo + "'";
            } else {
                hql = "update AssetUtilityDetails set status='Active' where SNo='" + SNo + "'";
            }
            Query query = session.createQuery(hql);
            int row = query.executeUpdate();
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        tx.commit();
        session.close();
    }
    
    @SuppressWarnings("unchecked")
    public List<BuildingHistoryManagementGrid> BuildingHistoryManagementGridId(String userId, String assetCode)
            throws HibernateException, SQLException {
        List<BuildingHistoryManagementGrid> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

                query = session.createQuery("from BuildingHistoryManagementGrid where assetCode='" + assetCode + "'");
         
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
    
    @SuppressWarnings("unchecked")
    public List<BuildingHistoryManagementGrid> BuildingHistoryManagementGridList(String userId, String sno)
            throws HibernateException, SQLException {
        List<BuildingHistoryManagementGrid> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno == null) {

                query = session.createQuery("from BuildingHistoryManagementGrid");  //where userId='" + userId + "'
         
            } else {
                query = session.createQuery("from BuildingHistoryManagementGrid where sno='"+sno+"'");
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
    
    public void BuildingHistoryManagementGridListSave(List<BuildingHistoryManagementGrid> grid) {
        for (Iterator<BuildingHistoryManagementGrid> iterator = grid.iterator(); iterator.hasNext();) {
            BuildingHistoryManagementGrid test = (BuildingHistoryManagementGrid) iterator.next();
            newBuildingHistoryManagementGridListSave(test);
        }
    }
    
    public void newBuildingHistoryManagementGridListSave(BuildingHistoryManagementGrid dis) {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(dis);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }
    
    public void updateSubAssetDetailStatus(String SNo,String status) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = null;
        try {
            if (status.equals("Active") || status.equals("Update0")) {
                hql = "update SubAssetDetails set status='Inactive' where SNo='" + SNo + "'";
            } else {
                hql = "update SubAssetDetails set status='Active' where SNo='" + SNo + "'";
            }
            Query query = session.createQuery(hql);
            int row = query.executeUpdate();
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        tx.commit();
        session.close();
    }
    
    
    @SuppressWarnings("unchecked")
    public List<AreaManagementGrid> areaManagementId(String userId, String assetCode)
            throws HibernateException, SQLException {
        List<AreaManagementGrid> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

                query = session.createQuery("from AreaManagementGrid where assetCode='" + assetCode + "'");
         
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
    
    @SuppressWarnings("unchecked")
    public List<AreaManagementGrid> areaManagementGridList(String userId, String sno)
            throws HibernateException, SQLException {
        List<AreaManagementGrid> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno == null) {

                query = session.createQuery("from AreaManagementGrid");  //where userId='" + userId + "'
         
            } else {
                query = session.createQuery("from AreaManagementGrid where sno='"+sno+"'");
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
    
    public void areaManagementGridListSave(List<AreaManagementGrid> grid) {
        for (Iterator<AreaManagementGrid> iterator = grid.iterator(); iterator.hasNext();) {
            AreaManagementGrid test = (AreaManagementGrid) iterator.next();
            newAreaManagementGridListSave(test);
        }
    }
    
    public void newAreaManagementGridListSave(AreaManagementGrid dis) {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(dis);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }
    
    public List<SubAssetDetails> selectUnitNumberslist(String assetCode) {
        List<SubAssetDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
          
                query = session.createSQLQuery("select sub_asset_name, sub_asset_code from arete_tms.sub_asset_details where asset_code='" + assetCode + "' ");
            
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

}

