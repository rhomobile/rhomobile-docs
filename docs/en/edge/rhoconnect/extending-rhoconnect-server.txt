Extending RhoConnect Application with custom routes
===

Adding custom routes to a Controller
---

You can provide custom routes support in your RhoConnect application and utilize all the powerful features of the typical Sinatra app. To do this, simply define your routes in the corresponding controller class. Endpoint URL for your routes will be relative to the controller's root.

The following example illustrates how to add a sample `my_custom_route` to the Product Controller:

    :::ruby
    class ProductController < Rhoconnect::Controller::Base
      get '/my_custom_route', :login_required => true do
        send_file 'public/my_file.png'
      end
    end

This route will have the following URL : GET '/app/v1/Product/my_custom_route'

The above custom route implementation will respond to client's GET request, verifies the current_user (which will be extracted from the RhoConnect session cookie and checked for validity by the `:login_required` condition)
and returns a static PNG file (which can be later used in BLOB syncs) 

Routes declaration order
---

At run-time all requests are being matched against the declared routes to find the appropriate route handler. Sinatra matches the routes sequentially in the order of their declaration until the first matching route signature is found. This can lead to a possibility where the declared route can hide subsequent routes. For example:

    :::ruby
    class ProductController < Rhoconnect::Controller::Base
      register Rhoconnect::Handler::Sync

      delete '/my_custom_route_delete', :login_required => true do
        # do something here
      end
    end

In the above example, user's custom route will never be called, because `register Rhoconnect::Handler::Sync` (which is responsible for [adding pre-defined SYNC routes](../rhoconnectapi/source-adapter-controller-api-ruby#register Rhoconnect::Handler::Sync)) will add `DELETE '/:id'` route.
As a result, ProductController will have the following routes map:

    * 1) DELETE '/:id'
    * 2) DELETE '/my_custom_route_delete'

At run-time, Controller will try to match `DELETE /my_custom_route_delete` with the FIRST appropriate route declaration - and, it will find that `DELETE '/:id'` is a good match. Controller will treat string `my_custom_route_delete` as an instance of an `:id` parameter.  So, the user-defined custom route will never be called - it is being hidden by the more-generic route that has been declared first in order.

In summary, you should always specify more-specific routes first followed by the more-generic routes. In the above example, moving the custom route's declaration above the line 'register Rhoconnect::Handler::Sync' will make the custom route match happening before the parametrized route. Alternatively, you can write your routes using "as unique as possible" signatures, i.e. in the above example, declaring the route as `DELETE '/my/custom_route/delete'` will not match any other route declaration.

NOTE: You can always see the routes that are available in your application using the `rhoconnect routes` command.

Using custom routes in BLOB syncs
---

After you create the new custom routes you can reference and use them from standard Rhodes applications.
For example, suppose you have a Rhodes app with a Product model. To use a custom route in BLOB syncs, define the following property in the Rhodes Product model (file: `app/Product/product.rb`):

    :::ruby
    # The model has already been created by the framework, and extends Rhom::RhomObject
    # You can add more methods here
    class Product
      include Rhom::PropertyBag

      # Uncomment the following line to enable sync with Product.
      enable :sync

      #add model specific code here
      property :my_custom_blob_field, :blob, :overwrite 
    end
  
To see the static image, modify the `app/Product/show.erb` file for the Product model in your Rhodes application:

    :::html
    <li>
      <div class="itemLabel">My Static Field Image</div>
      <div class="itemValue"><img src="<%=Rho::RhoApplication::get_blob_path(@product.my_custom_field)%>"></img></div>
    </li>
  
Then, modify your RhoConnect source adapter model (in `rhoconnect_app/models/ruby/product.rb`) to provide BLOB's url for the `my_custom_blob_field`:

    :::ruby
    def query(params=nil)
      parsed = JSON.parse(RestClient.get("#{@base}.json").body)

      @result={}
      parsed.each do |item|
        item["product"]["my_custom_field-rhoblob"] = "http://localhost:9292/app/v1/Product/my_custom_route"
        @result[item["product"]["id"].to_s] = item["product"]
      end if parsed    
    end

This way, your `my_custom_field` would be getting the BLOB image data from the custom route defined in your RhoConnect Source Adapter Controller.

For more information on BLOB syncs, see [this section](blob-sync). 