# Copyright Camptocamp SA 2012
# License: AGPL (GNU Affero General Public License)[http://www.gnu.org/licenses/agpl-3.0.txt]
# Author Guewen Baconnier
 
require "xmlrpc/client"
require 'pp'

XMLRPC::Config::ENABLE_NIL_PARSER = true
XMLRPC::Config::ENABLE_NIL_CREATE = true
 
class MagentoAPI
  
  attr_accessor :url, :api_user, :api_key
  
  def initialize(base_url, api_user, api_key, options={})
    @url = base_url << '/api/xmlrpc/'
    @api_user = api_user
    @api_key = api_key
    @debug = options[:debug] || false
   
  end
  
  def call(method, *arguments)
    @client = init_client
    @client.call('call', session_id, method, arguments)
  end

  def order_list(filters=nil)
  	# filters:  e.g.  -> {"customer_email" => {"eq" => "name@example.com"}, "status" => {"eq" => "canceled"} }
  	self.call('sales_order.list',filters)
  end

  def find_order(increment_id)
    self.call('sales_order.list',{"increment_id" => {"eq" => increment_id }}).first
  end

  def order_cancel(increment_id)
    self.call('sales_order.addComment',increment_id,'canceled')
  end
  
  def customer_info(customer_email)
    self.call('customer.list',{"email" => {"eq" => customer_email}})
  end

  def customer_exists(customer_email)
    c = 0
    find_customers(customer_email).each do |customer|
      c += 1
    end
    if c == 1 
      return true
    end
    return false
  end
  
  def find_customers(customer_email)
    self.call('customer.list',{"email" => {"eq" => customer_email}})
  end

  def delete_customers(customer_email)
    find_customers(customer_email).each do |customer|
      $stdout.puts "deleting customer:#{customer['firstname']} #{customer['lastname']} (#{customer['email']}) id:#{customer['customer_id']}"
      self.call('customer.delete',customer['customer_id'])
    end
  end
  
  private
  
  def init_client
    client = XMLRPC::Client.new2(@url)
    client.user="magentotest"
    client.password="AHkU56u43"
    http_debug(@debug)
    client.set_debug
    client
  end
  
  def http_debug(active)
    output = active ? $stderr : false
      
    XMLRPC::Client.class_eval do
      define_method :set_debug do
        @http.set_debug_output(output)
      end
    end
  end
  
  def session_id
    @client.call('login', @api_user, @api_key)
  end

  def self.cancel_test_orders(email_address,api_user,api_password,app_host)
    $stdout.puts "\ncancelling test-orders (app_host: #{app_host})"
    magento = MagentoAPI.new(app_host, api_user, api_password, :debug => false)
    order_list = magento.order_list({"customer_email" => {"eq" => "#{email_address}"}, "status" => {"neq" => "canceled"}})

    order_list.each do |order|
      $stdout.puts "canceling order id: #{order["increment_id"]} .. "
      if magento.order_cancel(order["increment_id"])
        $stdout.puts "Success"
      else
        $stdout.puts "Failed"
      end
    end
  end

end

