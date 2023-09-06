/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.Date;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author EBS02
 */
public class Common {

    public String upload(HttpServletRequest request, MultipartFile multipartFile) throws FileNotFoundException, IOException {
        String attachment = "";

        //System.out.println(multipartFile.getSize() + "multipartFile");
        String fileName = "";
        // image type of file processing...
        //System.err.println("-------------------------------------------");
        if (multipartFile.getSize() > 0) {
            try {
                InputStream inputStream = null;
                OutputStream outputStream = null;
                inputStream = multipartFile.getInputStream();
                fileName = request.getRealPath("") + File.pathSeparator + "reportfiles" + File.pathSeparator + multipartFile.getOriginalFilename();
                //System.out.println("FIleName:"+fileName);
                outputStream = new FileOutputStream(fileName);
                attachment = multipartFile.getOriginalFilename();
                int readBytes = 0;
                byte[] buffer = new byte[10000000];
                while ((readBytes = inputStream.read(buffer, 0, 10000000)) != -1) {
                    outputStream.write(buffer, 0, readBytes);
                }
                outputStream.close();
                inputStream.close();

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return attachment;

    }

    public void download(String filename, javax.servlet.http.HttpServletResponse res) throws FileNotFoundException, IOException {

        File file = new File(filename);

        FileInputStream fileInuptStream = new FileInputStream(file);
        BufferedInputStream bufferedInputStream = new BufferedInputStream(fileInuptStream);
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();

        int start = 0;
        int length = 1024;
        int offset = -1;
        byte[] buffer = new byte[length];

        while ((offset = bufferedInputStream.read(buffer, start, length)) != -1) {
            byteArrayOutputStream.write(buffer, start, offset);
        }

        bufferedInputStream.close();
        byteArrayOutputStream.flush();
        buffer = byteArrayOutputStream.toByteArray();
        byteArrayOutputStream.close();

        //add in to the response
        res.addHeader("Content-Disposition", "attachment;filename=\"" + file.getName() + "\"");
        res.addHeader("Content-Transfer-Encoding", "binary");
        res.setContentType("application/octet-stream");
        res.setContentLength((int) file.length());
        res.getOutputStream().write(buffer);
        res.getOutputStream().flush();

    }
    
     public static String schudeleSMS(String mobNo, String text) {
        String responseStatus = "";
        try {
            ClientBuilder builder = ClientBuilder.newBuilder();
            Client client = builder.build();
            text = text.replace("%", "");
            text = text.replace(" ", "%20");
            text = text.replace("#", "");
            //For sending sms to single mobile no
            WebTarget target = client.target("http://198.24.149.4/API/pushsms.aspx?loginID=ERP%20SECTION&password=sms123456&mobile=" + mobNo.trim() + "&text=" + text + "&senderid=KEOTRG&route_id=8&Unicode=0");
            Response res = target.request(MediaType.APPLICATION_JSON).get();
            responseStatus = "" + res.getStatus();
        } catch (Exception e) {
            e.printStackTrace();
        }
//        System.out.println("----------sendSMS--------"+responseStatus);
        return responseStatus;
    }
     public static String sendBulkSMS(String mobNo, String text) {
        String responseStatus = "";
        try {
            ClientBuilder builder = ClientBuilder.newBuilder();
            Client client = builder.build();
            text = text.replace("%", "");
            text = text.replace(" ", "%20");
            text = text.replace("#", "");
            //For bulk sms mobile nos are seperated by comma
            WebTarget target = client.target("http://198.24.149.4/API/pushsms.aspx?loginID=ERP%20SECTION&password=sms123456&mobile=" + mobNo.trim() + "&text=" + text + "&senderid=KEOTRG&route_id=8&Unicode=0");
            Response res = target.request(MediaType.APPLICATION_JSON).get();
            responseStatus = "" + res.getStatus();
        } catch (Exception e) {
            e.printStackTrace();
        }
//        System.out.println("----------sendBulkSMS--------"+responseStatus);
        return responseStatus;
    }

    public static String schudeleSMS(String mobNo, String text, String time) {
        String responseStatus = "";
        try {
            ClientBuilder builder = ClientBuilder.newBuilder();
            Client client = builder.build();
            text = text.replace("%", "");
            text = text.replace(" ", "%20");
            text = text.replace("#", "");
            //Time in format of 1510201819:42
            WebTarget target = client.target("http://198.24.149.4/API/pushsms.aspx?loginID=ERP%20SECTION&password=sms123456&mobile=" + mobNo.trim() + "&text=" + text + "&senderid=KEOTRG&route_id=8&Unicode=0&sch=" + time.trim());
            Response res = target.request(MediaType.APPLICATION_JSON).get();
            responseStatus = "" + res.getStatus();
        } catch (Exception e) {
            e.printStackTrace();
        }
//        System.out.println("----------schudeleSMS--------"+responseStatus);
        return responseStatus;
    }

    public static String schudeleDate(Date nextFollowup) {
        String schDate = "";
        DecimalFormat mFormat = new DecimalFormat("00");
        long DAY_IN_MS = 1000 * 60 * 60 * 24;
        Date folDtFDB = new Date(nextFollowup.getTime() - (5 * DAY_IN_MS));
        Calendar cal = Calendar.getInstance();
        cal.setTime(folDtFDB);
        int fuyear = cal.get(Calendar.YEAR);
        int fumonth = cal.get(Calendar.MONTH) + 1;
        int fuday = cal.get(Calendar.DAY_OF_MONTH);
        String sfuDay = mFormat.format(fuday);
        String sfuMon = mFormat.format(fumonth);
        String sfuYear = mFormat.format(fuyear);
        schDate = sfuDay + sfuMon + sfuYear + "10:10";
        return schDate;
    }

    public void sendEmail(String from, String password, String[] to, String subject, String body, ByteArrayOutputStream bs, String fileName) throws MessagingException {
        Properties props = new Properties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", password);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "587");
        //String[] to = {to}; // added this line

        Session session = Session.getDefaultInstance(props, null);
        MimeMessage message = new MimeMessage(session);
        try {
            message.setFrom(new InternetAddress(from));
        } catch (Exception e) {
        }
        InternetAddress[] toAddress = new InternetAddress[to.length];
        for (int j = 0; j < to.length; j++) { // changed from a while loop
            try {
                toAddress[j] = new InternetAddress(to[j]);
            } catch (Exception e) {
            }
        }
        System.out.println(Message.RecipientType.TO);
        for (int j = 0; j < toAddress.length; j++) { // changed from a while loop
            try {
                message.addRecipient(Message.RecipientType.TO, toAddress[j]);
            } catch (Exception e) {
            }
        }
        try {
            message.setSubject(subject);
            Multipart multipart = new MimeMultipart();
            MimeBodyPart messagePart = new MimeBodyPart();
//            messagePart.setText(body);

            messagePart.setContent(body, "text/html; charset=utf-8");
            multipart.addBodyPart(messagePart);

            BodyPart attachment = null;
            if (bs != null) {
                byte[] bytes = bs.toByteArray();
                if (bs.size() > 0) {
                    attachment = new MimeBodyPart();
                    DataSource source = new ByteArrayDataSource(bytes, "application/pdf");
                    attachment.setDataHandler(new DataHandler(source));
                    attachment.setFileName(fileName);
                    multipart.addBodyPart(attachment);
                }
            }

            message.setContent(multipart);

            Transport transport = session.getTransport("smtp");
            transport.connect("smtp.gmail.com", from, password);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    public void sendEmail1(String from, String password, String[] to, String subject, String body, ByteArrayOutputStream bs,String fileName,String[] cc,String Host) throws MessagingException {
        Properties props = new Properties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", Host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", password);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "587");
        //String[] to = {to}; // added this line

        Session session = Session.getDefaultInstance(props, null);
        MimeMessage message = new MimeMessage(session);
        try {
            message.setFrom(new InternetAddress(from));
        } catch (Exception e) {
        }
        InternetAddress[] toAddress = new InternetAddress[to.length];
        for (int j = 0; j < to.length; j++) { // changed from a while loop
            try {
                toAddress[j] = new InternetAddress(to[j]);
            } catch (Exception e) {
            }
        }
        System.out.println(Message.RecipientType.TO);
        for (int j = 0; j < toAddress.length; j++) { // changed from a while loop
            try {
                message.addRecipient(Message.RecipientType.TO, toAddress[j]);
            } catch (Exception e) {
            }
        }
        if(cc!=null)
        {
        InternetAddress[] ccAddress = new InternetAddress[cc.length];
        for (int k = 0; k < cc.length; k++) { // changed from a while loop
            try {
                ccAddress[k] = new InternetAddress(cc[k]);
            } catch (Exception e) {
            }
        }
        for (int l = 0; l< ccAddress.length; l++) { // changed from a while loop
            try {
                message.addRecipient(Message.RecipientType.CC, ccAddress[l]);
            } catch (Exception e) {
            }
        }
        }
        
        try {
            message.setSubject(subject);
            Multipart multipart = new MimeMultipart();
            MimeBodyPart messagePart = new MimeBodyPart();
//            messagePart.setText(body);

            messagePart.setContent(body, "text/html; charset=utf-8");
            multipart.addBodyPart(messagePart);
            
            BodyPart attachment = null; 
            if(bs!=null){
            byte[] bytes = bs.toByteArray();         
            if (bs.size() > 0) {
                attachment = new MimeBodyPart();
                DataSource source = new ByteArrayDataSource(bytes, "application/octet-stream");
                attachment.setDataHandler(new DataHandler(source));
                attachment.setFileName(fileName);
                multipart.addBodyPart(attachment);
            }
            }
            
            message.setContent(multipart);

            Transport transport = session.getTransport("smtp");
            transport.connect(Host, from, password);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();

         }catch (Exception e) {
            e.printStackTrace();
        }
       
    }

}