RhoConnect-Java
===

RhoConnect-Java library is designed for the [RhoConnect](http://rhomobile.com/products/rhoconnect/) App Integration Server.

Using the RhoConnect-Java plugin, your [Spting 3 MVC](http://www.springsource.org/) application's data will transparently synchronize with a mobile application built on the [Rhodes framework](http://rhomobile.com/products/rhodes), or any of the available [RhoConnect clients](http://rhomobile.com/products/rhoconnect/).

## Getting started

We assume that you have a complete java end-to-end application using Spring 3.0 MVC as the front end technology and Hibernate as backend ORM. For this application we will also use Maven2 for build and dependency management and some database to persist the data. The database is accessed by a Data Access (DAO) layer.

For testing and evaluation purposes you can use [RhoconnectJavaSample](https://github.com/shurab/RhoconnectJavaSample) application as a starting point before continuing with the following steps.

### Adding Dependencies to Your Maven 2 Project

Add dependencies to your Apache Maven 2 project object model (POM): apache common beanutils, and Jackson JSON mapper. In the RhoconnectJavaSample application, this code is in the pom.xml file.

    :::xml
    <!-- apache commons beanutils -->  
    <dependency>  
        <groupId>commons-beanutils</groupId>  
    	<artifactId>commons-beanutils</artifactId>  
        <version>1.8.3</version>  
    </dependency>
    <!-- Jackson JSON Mapper -->  
    <dependency>  
        <groupId>org.codehaus.jackson</groupId>  
        <artifactId>jackson-mapper-asl</artifactId>  
        <version>1.9.0</version>  
        <type>jar</type>  
        <optional>false</optional>  
    </dependency>  

### Updating Your Servlet XML Configuration File

Update your servlet xml configuration file to include rhoconnect-java metadata: the packages, converters, and beans. In the RhoconnectJavaSample, this code is in comments in the src/main/webapp/WEB-INF/spring-servlet.xml file.

    :::xml
    <!-- rhoconnect-java plugin packages -->
    <context:component-scan base-package="com.rhomobile.rhoconnect.controller" /> 

    <!-- rhoconnect-java plugin converters -->
    <bean class="org.springframework.web.servlet.mvc.annotation.AnnotationMethodHandlerAdapter">
     	<property name="order" value="1" />
     	<property name="messageConverters">
         	<list>
             	<ref bean="stringHttpMessageConverter"/>
             	<ref bean="jsonConverter" />
         	</list>
     	</property>
    </bean>

    <bean id="jsonConverter" class="org.springframework.http.converter.json.MappingJacksonHttpMessageConverter">
     	<property name="supportedMediaTypes" value="application/json" />
    </bean>

    <bean id="stringHttpMessageConverter" class="org.springframework.http.converter.StringHttpMessageConverter">
    </bean>
    
    <bean id="restTemplate" class="org.springframework.web.client.RestTemplate">
     	<property name="messageConverters">
         	<list>
             	<ref bean="jsonConverter" />
             	<ref bean="stringHttpMessageConverter"/>
         	</list>
     	</property>
    </bean>    

    <!-- rhoconnect-java plugin beans -->
    <bean id="rhoconnect" class = "com.rhomobile.rhoconnect.RhoconnectImpl" />
    
    <bean id="rhoconnectClient" class = "com.rhomobile.rhoconnect.RhoconnectClient" init-method="setAppEndpoint" >
     	<property name="restTemplate"><ref bean="restTemplate"/></property>
     	<property name="endpointUrl" value="your_rhoconnect_server_url" />
     	<property name="appEndpoint" value="your_spring_app_url" />
     	<property name="apiToken" value="rhoconnect_api_token" />
    </bean>

The `setAppEndpoint` method in the `rhoconnectClient` bean in the above code sample is a main point in establishing the communication 
link between the `Rhoconnect` server and the Spring 3 MVC application. It has the following properties that you need to configure.

<table border="1">
  <tr>
	<td><code>endpointUrl</code></td>
	<td>rhoconnect server's url, for example <code>http://localhost:9292</code>.</td>
  </tr>
  <tr>
	<td><code>appEndpoint</code></td>
	<td>your Spring 3 MVC app url, for example <code>http://localhost:8080/contacts</code>.</td>
  </tr>
  <tr>
	<td><code>apiToken</code></td>
	<td>rhoconnect server's api_token, for example <code>sometokenforme</code>.</td>
  </tr>
</table>


### Adding rhoconnect-java to the Build Path

You must add the rhoconnect-java jar to your apache maven 2 build classpath. In the RhoconnectJavaSample application, you would add this code to the pom.xml file, putting in the path to your rhoconnect-java jar into the systemPath.

    :::xml
    <dependency>
        <groupId>rhoconnect-java</groupId>
        <artifactId>rhoconnect-java</artifactId>
        <version>0.0.1</version>
        <scope>system</scope>
        <!-- Set absolute path to your rhoconnect-java jar -->
        <systemPath>/path-to-jar-directory/rhoconnect-java-0.0.1.jar</systemPath> 
    </dependency>


### Establishing communication from the RhoConnect server to java back-end application

You need to establish communication from the RhoConnect instance to your java back-end application by implementing Rhoconnect interface.

    :::java
    package com.rhomobile.rhoconnect;
    import java.util.Map;

    public interface Rhoconnect {
        boolean authenticate(String login, String password, Map<String, Object> attribures);
        
        Map<String, Object> query_objects(String resource, String partition);
        Integer create(String resource, String partition, Map<String, Object> attributes);
        Integer update(String resource, String partition, Map<String, Object> attributes);
        Integer delete(String resource, String partition, Map<String, Object> attributes);
    }

For example, `RhoconnectJavaSample` application implementation is based on `contactService` API:

    :::java
    /**
    * RhoconnectImpl.java 
    */
    package com.rhomobile.rhoconnect;

    import java.util.HashMap;
    import java.util.Iterator;
    import java.util.List;
    import java.util.Map;

    import org.apache.commons.beanutils.BeanUtils;
    import org.springframework.beans.factory.annotation.Autowired;

    import com.rhomobile.contact.form.Contact;
    import com.rhomobile.contact.service.ContactService;

    public class RhoconnectImpl implements Rhoconnect {

        @Autowired
        private ContactService contactService;	

        @Override
        public boolean authenticate(String login, String password, Map<String, Object> attribures) {
            // TODO: your authentication code goes here ...
            return true;
        }
	
        @Override
        public Map<String, Object> query_objects(String resource, String partition) {
            Map<String, Object> h = new HashMap<String, Object>();
            List<Contact> contacts =  contactService.listContact();		
            Iterator<Contact> it = contacts.iterator( );
            while(it.hasNext()) {
                Contact c =(Contact)it.next();
          	    h.put(c.getId().toString(), c);
            }
            return h;
        }

        @Override
        public Integer create(String resource, String partition, Map<String, Object> attributes) {
            Contact contact = new Contact();
            try {
                BeanUtils.populate(contact, attributes);
                int id = contactService.addContact(contact);
                return id;
            } catch(Exception e) {
                e.printStackTrace();
            }
            return null;
        }

        @Override
        public Integer update(String resource, String partition, Map<String, Object> attributes) {
            Integer id = Integer.parseInt((String)attributes.get("id"));
            Contact contact = contactService.getContact(id);
            try {
                BeanUtils.populate(contact, attributes);
    		    contactService.updateContact(contact);
    		    return id;
            } catch(Exception e) {
                e.printStackTrace();
            }
            return null;
        }

        @Override
        public Integer delete(String resource, String partition, Map<String, Object> attributes) {
            String objId = (String)attributes.get("id");
            Integer id = Integer.parseInt(objId);
            contactService.removeContact(id);		
            return id;
        }
    }

### Establishing communication from java back-end application to the RhoConnect server

You also must to establish the communication from your java back-end application to the RhoConnect instance by autowiring your data access (DAO) service layer with RhoconnectClient bean and inserting notifications hooks there.

    :::java
    package com.rhomobile.rhoconnect;
    
    public class RhoconnectClient {
        // ...
        public boolean notifyOnCreate(String sourceName, String partition, Object objId, Object object);
        public boolean notifyOnUpdate(String sourceName, String partition, Object objId, Object object);
        public boolean notifyOnDelete(String sourceName, String partition, Object objId);
        // ...
    }

For example, `RhoconnectJavaSample` application uses the following implementation:

    :::java
    package com.rhomobile.contact.service;
    import java.util.List;

    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.stereotype.Service;
    import org.springframework.transaction.annotation.Transactional;

    import com.rhomobile.contact.dao.ContactDAO;
    import com.rhomobile.contact.form.Contact;

    import com.rhomobile.rhoconnect.RhoconnectClient;
    //import org.apache.log4j.Logger;

    @Service
    public class ContactServiceImpl implements ContactService {

        @Autowired
        private ContactDAO contactDAO;

        @Autowired
        private RhoconnectClient client;

        //private static final Logger logger = Logger.getLogger(ContactServiceImpl.class);

        private static final String sourceName  = "Contact"; // name of DAO model
        
        // Data partitioning: i.e. your user name for filtering data on per user basis 
        private static final String partition  = "your_partition";
	
        @Transactional
        public int addContact(Contact contact) {
            int id = contactDAO.addContact(contact);
            client.notifyOnCreate(sourceName, partition, Integer.toString(id), contact);
            return id;
        }

        @Transactional
        public void updateContact(Contact contact) {
            contactDAO.updateContact(contact);
            client.notifyOnUpdate(sourceName, partition, Integer.toString(contact.getId()), contact);		
        }

        @Transactional
        public void removeContact(Integer id) {
            contactDAO.removeContact(id);
            client.notifyOnDelete(sourceName, partition, Integer.toString(id));
        }

        @Transactional
        public List<Contact> listContact() {
            return contactDAO.listContact();
        }

        @Transactional
        public Contact getContact(Integer id) {
            return contactDAO.getContact(id);
        }
     }

For more information about RhoConnect partitions, please refer to the [RhoConnect docs](http://docs.rhomobile.com/rhosync/source-adapters#data-partitioning).


## Meta
Created and maintained by Alexander Babichev.

Released under the [MIT License](http://www.opensource.org/licenses/mit-license.php).
