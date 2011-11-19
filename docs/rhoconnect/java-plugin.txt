RhoConnect-Java
===

RhoConnect-Java library is designed for the [RhoConnect](http://rhomobile.com/products/rhoconnect/) App Integration Server.

Using the RhoConnect-Java plugin, your [Spting 3 MVC](http://www.springsource.org/) application's data will transparently synchronize with a mobile application built on the [Rhodes framework](http://rhomobile.com/products/rhodes), or any of the available [RhoConnect clients](http://rhomobile.com/products/rhoconnect/).

## Prerequisites

* Java (1.6)
* Maven2 (2.2.1)
* Git

You can create target rhoconnect-java plugin jar from sources by executing the following commands:
    
    :::term
    mvn clean
    mvn compile
    mvn jar:jar
    
Archived rhoconnect-java-x.y.z.jar file will be created in the target/ directory.   

## Getting started

We assume that you have a complete java end-to-end application using Spring 3.0 MVC as the front end technology and Hibernate as backend ORM. For this application we will also use Maven2 for build and dependency management and some database to persist the data. The database is accessed by a Data Access (DAO) layer.

For testing and evaluation purposes you can use [RhoconnectJavaSample](https://github.com/shurab/RhoconnectJavaSample) application as a starting point before continuing with the following steps.

### Adding Dependencies to Your Maven 2 Project

Add dependencies to your Apache Maven 2 project object model (POM): apache common beanutils, log4j, and Jackson JSON mapper. In the RhoconnectJavaSample application, this code is in the pom.xml file.

    :::xml
    <!-- apache commons beanutils -->  
    <dependency>  
        <groupId>commons-beanutils</groupId>  
    	<artifactId>commons-beanutils</artifactId>  
        <version>1.8.3</version>  
    </dependency>
    <!-- Log4j -->
    <dependency>
        <groupId>log4j</groupId>
        <artifactId>log4j</artifactId>
        <version>1.2.9</version>
        <type>jar</type>
        <optional>false</optional>
    </dependency>
    <!-- Jackson JSON Mapper -->  
    <dependency>  
        <groupId>org.codehaus.jackson</groupId>  
        <artifactId>jackson-mapper-asl</artifactId>  
        <version>1.9.0</version>  
        <type>jar</type>  
        <optional>false</optional>  
    </dependency>

### Adding rhoconnect-java jar to the Build Path

You must add the rhoconnect-java jar to your apache maven 2 build classpath. In the RhoconnectJavaSample application, you would add this code to the pom.xml file, putting in the path to your rhoconnect-java jar into the systemPath.

    :::xml
    <dependency>
	    <groupId>com.rhomobile.rhoconnect</groupId>
	    <artifactId>rhoconnect-java</artifactId>
	    <version>1.0-SNAPSHOT</version>
	    <scope>system</scope>
	    <systemPath>/absolute-path-to-your-directory/rhoconnect-java-1.0-SNAPSHOT.jar</systemPath>
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
    <bean id="dispatcher" class = "com.rhomobile.rhoconnect.RhoconnectDispatcher"></bean>
    
    <!-- This bean should implement your application specific authentication -->
    <bean id="authenticate" class = "com.rhomobile.rhoconnect.RhoconnectAuthenticate" />

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

The final step in configuration is to implement application specific authentication code. You should create a class by implementing the following interface: 

    :::java
    package com.rhomobile.rhoconnect;
    import java.util.Map;

    public interface Rhoconnect {
        boolean authenticate(String login, String password, Map<String, Object> attributes);    
    }
 
For example:

    :::java
	package com.rhomobile.rhoconnect;
	import java.util.Map;
    public class RhoconnectAuthenticate implements Rhoconnect {
	    @Override
	    public boolean authenticate(String login, String password, Map<String, Object> attributes) {
            // TODO: your authentication code goes here ...
		    return true;
	    }
    }
 
### Establishing communication from the RhoConnect server to java back-end application

You need to establish communication from the RhoConnect instance to your java back-end application by mixing RhoconnectResource interface in your service bean:

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
* Service bean should be autowired into corresponding controller via @Autowired annotation 

For example, `RhoconnectJavaSample` application implementation is based on `contactService` class:

    :::java
    /**
    * ContactServiceImpl.java 
    */
	package com.rhomobile.contact.service;
    // ...
	
	@Service
	public class ContactServiceImpl implements ContactService, RhoconnectResource {
	    @Autowired
	    private ContactDAO contactDAO;
	    // ...
	    private static final String sourceName  = "Contact"; // name of DAO model
    
	    @Transactional
	    public int addContact(Contact contact)     { /* ... */ }
	
	    @Transactional
	    public void updateContact(Contact contact) { /* ... */ }
	
	    @Transactional
	    public void removeContact(Integer id)      { /* ... */ }

	    @Transactional
	    public List<Contact> listContact()         { /* ... */ }

	    @Transactional
	    public Contact getContact(Integer id)      { /* ... */ }
 
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

For more information about RhoConnect partitions, please refer to the [RhoConnect docs](http://docs.rhomobile.com/rhosync/source-adapters#data-partitioning).

### Establishing communication from java back-end application to the RhoConnect server

You also must to establish the communication from your java back-end application to the RhoConnect instance by auto-wiring RhoconnectClient bean into your data access (DAO) service layer and inserting notifications hooks into data access methods.

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
    /**
    * ContactServiceImpl.java 
    */
	package com.rhomobile.contact.service;
    // ...
	
	@Service
	public class ContactServiceImpl implements ContactService, RhoconnectResource {
		// ...
	    @Autowired
	    private RhoconnectClient client;
	    private static final String sourceName  = "Contact"; // name of DAO model

	    @Transactional
	    public int addContact(Contact contact) {
	        int id = contactDAO.addContact(contact);
	        String partition  = getPartition();
	        client.notifyOnCreate(sourceName, partition, Integer.toString(id), contact);
	        return id;
	    }

	    @Transactional
	    public void updateContact(Contact contact) {
	        contactDAO.updateContact(contact);
	        String partition  = getPartition();
	        client.notifyOnUpdate(sourceName, partition, Integer.toString(contact.getId()), contact);       
	    }

	    @Transactional
	    public void removeContact(Integer id) {
	        contactDAO.removeContact(id);
	        String partition  = getPartition();
	        client.notifyOnDelete(sourceName, partition, Integer.toString(id));
	    }

	    @Transactional
	    public List<Contact> listContact()         { /* ... */ }

	    @Transactional
	    public Contact getContact(Integer id)      { /* ... */ }
	
	    // ...
	 }

## Meta
Created and maintained by Alexander Babichev.

Released under the [MIT License](http://www.opensource.org/licenses/mit-license.php).
