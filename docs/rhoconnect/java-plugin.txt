RhoConnect-Java
===

RhoConnect-Java library is designed for the [RhoConnect](http://rhomobile.com/products/rhoconnect/) Application Integration Server.

Using the RhoConnect-Java plugin, your [Spring 3 MVC](http://www.springsource.org/) application's data will transparently synchronize with a mobile application built on the [Rhodes framework](http://rhomobile.com/products/rhodes), or any of the available [RhoConnect clients](http://rhomobile.com/products/rhoconnect/).

## Prerequisites

* Java (1.6)
* Maven2 (2.2.1)
* Git
* [Rhoconncect-java](https://github.com/downloads/rhomobile/rhoconnect-java/rhoconnect-java-1.0-SNAPSHOT.jar) plugin jar file

## Getting started

We assume that you have a complete java end-to-end application using Spring 3.0 MVC as the front end technology and Hibernate as backend ORM. For this application we will also use Maven2 for build and dependency management and some database to persist the data. The database is accessed by a Data Access (DAO) layer.

Copy [Rhoconncect-java](https://github.com/downloads/rhomobile/rhoconnect-java/rhoconnect-java-1.0-SNAPSHOT.jar) plugin jar file to your PC.
You can also create target rhoconnect-java plugin jar from sources by cloning rhoconnect-java repository 

    :::term
    $ git clone git@github.com:rhomobile/rhoconnect-java.git

and executing in cloned project directory the following commands:

    :::term
    $ mvn clean
    $ mvn compile
    $ mvn jar:jar

The archived rhoconnect-java-x.y.z.jar file will be created in the project target/ directory.

For testing and evaluation purposes you can use [RhoconnectJavaSample](https://github.com/shurab/RhoconnectJavaSample) application as a starting point before continuing with the following steps. 

### Adding Dependencies to Your Maven 2 Project

Add dependencies to your Apache Maven 2 project object model (POM): log4j, Apache common beanutils, and Jackson JSON mapper. In the RhoconnectJavaSample application, this code is in the pom.xml file.

    :::xml
    <!-- Log4j -->
    <dependency>
        <groupId>log4j</groupId>
        <artifactId>log4j</artifactId>
        <version>1.2.9</version>
        <type>jar</type>
        <optional>false</optional>
    </dependency>
    <!-- Apache Commons Beanutils and Jackson JSON Mapper required by rhoconnect-java plugin -->
    <dependency>
        <groupId>commons-beanutils</groupId>
        <artifactId>commons-beanutils</artifactId>
        <version>1.8.3</version>
    </dependency>
    <dependency>  
        <groupId>org.codehaus.jackson</groupId>  
        <artifactId>jackson-mapper-asl</artifactId>  
        <version>1.9.0</version>  
        <type>jar</type>  
        <optional>false</optional>  
    </dependency>

You must also add the rhoconnect-java jar to your Maven 2 project. At this moment rhoconnect-plugin jar is not available in Maven public repositories and you need install the jar manually into your Maven's local repository.
Download the `rhoconnect-java-1.0-SNAPSHOT.jar` jar file and put it into your hard drive, and issue the following Maven's command:

    :::term
	$ mvn install:install-file -Dfile=/path-to-jar/rhoconnect-java-1.0-SNAPSHOT.jar -DgroupId=com.rhomobile.rhoconnect  -DartifactId=rhoconnect-java -Dversion=1.0-SNAPSHOT -Dpackaging=jar

Now, the `rhoconnect-java` jar library is included into your Maven local repository.
In the RhoconnectJavaSample application, you would add this code to the pom.xml file.

    :::xml
    <!-- Rhoconnect-java plugin -->
	<dependency>
    	<groupId>com.rhomobile.rhoconnect</groupId>
    	<artifactId>rhoconnect-java</artifactId>
    	<version>1.0-SNAPSHOT</version>
    	<type>jar</type>
	</dependency>

### Updating Your Servlet XML Configuration File

Update your servlet xml configuration file to include rhoconnect-java metadata: the packages, converters, and beans. In the RhoconnectJavaSample, the following code is added to src/main/webapp/WEB-INF/spring-servlet.xml file.

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
    <bean id="dispatcher" class = "com.rhomobile.rhoconnect.RhoconnectDispatcher"></bean>
    <bean id="rhoconnectClient" class = "com.rhomobile.rhoconnect.RhoconnectClient" init-method="setAppEndpoint" >
     	<property name="restTemplate"><ref bean="restTemplate"/></property>
     	<property name="endpointUrl" value="your_rhoconnect_server_url" />
     	<property name="appEndpoint" value="your_spring_app_url" />
     	<property name="apiToken" value="rhoconnect_api_token" />
    </bean>
    
    <!--The following bean handles the application's authentication routine and should be implemented by you -->
    <bean id="authenticate" class = "com.rhomobile.contact.ContactAuthenticate" />

The `setAppEndpoint` method in the `rhoconnectClient` bean in the above code sample is a main point in establishing the communication 
link between the `Rhoconnect` server and the Spring 3 MVC application. It has the following properties that you need to configure.

<table border="1">
  <tr>
	<td><code>endpointUrl</code></td>
	<td>rhoconnect server's url, for example <code>http://localhost:9292</code></td>
  </tr>
  <tr>
	<td><code>appEndpoint</code></td>
	<td>your Spring 3 MVC app url, for example <code>http://localhost:8080/contacts</code></td>
  </tr>
  <tr>
	<td><code>apiToken</code></td>
	<td>rhoconnect server's api_token, for example <code>sometokenforme</code></td>
  </tr>
</table>

The `authenticate` bean will be called by rhoconnect server to authenticate users, and has to implement `Rhoconnect` interface provided by rhoconnect-java plugin: 

    :::java
    package com.rhomobile.rhoconnect;
    import java.util.Map;

    public interface Rhoconnect {
        boolean authenticate(String login, String password, Map<String, Object> attributes);    
    }

For example:

    :::java
    package com.rhomobile.contact;

    import java.util.Map;
    import org.apache.log4j.Logger;
    import com.rhomobile.rhoconnect.Rhoconnect;

    public class ContactAuthenticate implements Rhoconnect {
        private static final Logger logger = Logger.getLogger(ContactAuthenticate.class);

        @Override
        public boolean authenticate(String login, String password, Map<String, Object> attributes) {
            logger.info("ContactAuthenticate#authenticate: implement your authentication code!");
            // TODO: your authentication code goes here ...
            return true;
        }
    }

### Establishing communication from the RhoConnect server to java back-end application

You need to establish communication from the RhoConnect instance to your java back-end application by mixing RhoconnectResource interface in your data access (DAO) service class:

    :::java
	package com.rhomobile.rhoconnect;

	import java.util.Map;

	public interface RhoconnectResource {
		Map<String, Object> rhoconnectQuery(String partition);
		Integer rhoconnectCreate(String partition, Map<String, Object> attributes);
		Integer rhoconnectUpdate(String partition, Map<String, Object> attributes);
		Integer rhoconnetDelete(String partition, Map<String, Object> attributes);
		String getPartition();
	}

To help rhoconnect-java plugin correctly do mapping of model name to service bean you should take into account the following conventions:

* Name of the DAO service bean (class) should be model name followed by `ServiceImpl` suffix (i. e. `ContactServiceImpl` for model `Contact`)  
* Service bean should be auto-wired into corresponding controller via @Autowired annotation 

Data partitioning in your code should be based on filtering data for unique user (i.e. your user name) or per application (shared dataset for all users).
For more information about RhoConnect partitions, please refer to the [RhoConnect docs](http://docs.rhomobile.com/rhosync/source-adapters#data-partitioning).

### Establishing communication from java back-end application to the RhoConnect server

You also must to establish the communication from your java back-end application to the RhoConnect instance by auto-wiring `RhoconnectClient` bean into your DAO service class and inserting notifications hooks into data access (create/update/delete) methods. 
`RhoconnectClient` bean is provided by rhoconnect-java plugin and responds to the following methods you have to call:

* boolean notifyOnCreate(String sourceName, String partition, Object objId, Object object)
* boolean notifyOnUpdate(String sourceName, String partition, Object objId, Object object)
* boolean notifyOnDelete(String sourceName, String partition, Object objId)

Example for `RhoconnectJavaSample` application:

    :::java
	package com.rhomobile.contact.service;

	import java.util.HashMap;
	import java.util.Iterator;
	import java.util.List;
	import java.util.Map;

	import org.apache.commons.beanutils.BeanUtils;
	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.stereotype.Service;
	import org.springframework.transaction.annotation.Transactional;

	import com.rhomobile.contact.dao.ContactDAO;
	import com.rhomobile.contact.form.Contact;

	import com.rhomobile.rhoconnect.RhoconnectClient;
	import com.rhomobile.rhoconnect.RhoconnectResource;

	@Service
	public class ContactServiceImpl implements ContactService, RhoconnectResource {
	    //private static final Logger logger = Logger.getLogger(ContactServiceImpl.class);

	    @Autowired
	    private ContactDAO contactDAO;
	    @Autowired
	    private RhoconnectClient client;
	    private static final String sourceName  = "Contact"; // name of DAO model

	    @Transactional
	    public int addContact(Contact contact) {
	        int id = contactDAO.addContact(contact);
	        client.notifyOnCreate(sourceName, getPartition(), Integer.toString(id), contact);
	        return id;
	    }

	    @Transactional
	    public void updateContact(Contact contact) {
	        contactDAO.updateContact(contact);
	        client.notifyOnUpdate(sourceName, getPartition(), Integer.toString(contact.getId()), contact);       
	    }

	    @Transactional
	    public void removeContact(Integer id) {
	        contactDAO.removeContact(id);
	        client.notifyOnDelete(sourceName, getPartition(), Integer.toString(id));
	    }

	    @Transactional
	    public List<Contact> listContact() {
	        return contactDAO.listContact();
	    }

	    @Transactional
	    public Contact getContact(Integer id) {
	        return contactDAO.getContact(id);
	    }

	    @Override
	    @Transactional
	    public Map<String, Object> rhoconnectQuery(String partition) {
	        Map<String, Object> h = new HashMap<String, Object>();
	        List<Contact> contacts =  listContact();

	        Iterator<Contact> it = contacts.iterator( );
	        while(it.hasNext()) {
	            Contact c =(Contact)it.next();
	            h.put(c.getId().toString(), c);
	        }
	        return h;
	    }

	    @Override
	    @Transactional
	    public Integer rhoconnectCreate(String partition, Map<String, Object> attributes) {
	        Contact contact = new Contact();
	        try {
	            BeanUtils.populate(contact, attributes);
	            int id = addContact(contact);
	            return id;
	        } catch(Exception e) {
	            e.printStackTrace();
	        }
	        return null;
	    }

	    @Override
	    @Transactional
		public Integer rhoconnectUpdate(String partition, Map<String, Object> attributes) {
	        Integer id = Integer.parseInt((String)attributes.get("id"));
	        Contact contact = getContact(id);
	        try {
	            BeanUtils.populate(contact, attributes);
	            updateContact(contact);
	            return id;
	        } catch(Exception e) {
	            e.printStackTrace();
	        }
	        return null;
	    }

	    @Override
	    @Transactional
	    public Integer rhoconnetDelete(String partition, Map<String, Object> attributes) {
	        String objId = (String)attributes.get("id");
	        Integer id = Integer.parseInt(objId);
	        removeContact(id);       
	        return id;
	    }

	    @Override
	    public String getPartition() {
	        // Data partitioning: i.e. your user name for filtering data on per user basis 
	        return "alexb";
	    }
	 }

Click [here](https://github.com/shurab/RhoconnectJavaPluginDemo) to download full source code of Contact manager application with rhoconnect-java plugin.

## Meta
Created and maintained by Alexander Babichev.

Released under the [MIT License](http://www.opensource.org/licenses/mit-license.php).
