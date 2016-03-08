# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rspec'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = "spec/vcr"
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    # Choose a test framework:
    with.test_framework :rspec

    with.library :rails
  end
end

def json_response
  @json_response ||= JSON.parse(response.body, symbolize_names: true)
end

def sample_product_result
  {:sku=>9678429,
 :productId=>1219427389475,
 :name=>"Sennheiser - Camera-Mount Wireless Microphone System - Black",
 :source=>"other",
 :type=>"HardGood",
 :startDate=>"2014-10-24",
 :new=>false,
 :active=>true,
 :lowPriceGuarantee=>true,
 :activeUpdateDate=>"2016-02-01T18:10:18",
 :regularPrice=>629.95,
 :salePrice=>629.95,
 :onSale=>false,
 :planPrice=>nil,
 :priceWithPlan=>[],
 :priceRestriction=>nil,
 :priceUpdateDate=>"2015-05-22T09:59:48",
 :digital=>false,
 :preowned=>false,
 :carrierPlans=>[],
 :technologyCode=>nil,
 :carrierModelNumber=>nil,
 :earlyTerminationFees=>[],
 :outletCenter=>nil,
 :secondaryMarket=>nil,
 :frequentlyPurchasedWith=>[],
 :accessories=>[],
 :relatedProducts=>
  [{:sku=>9678447},
   {:sku=>1725436},
   {:sku=>9680166},
   {:sku=>9678456},
   {:sku=>6484146},
   {:sku=>9678483},
   {:sku=>4331415},
   {:sku=>6913998},
   {:sku=>6748261},
   {:sku=>8771086},
   {:sku=>1535364},
   {:sku=>1528005},
   {:sku=>1535355},
   {:sku=>1729876},
   {:sku=>4896037},
   {:sku=>1736046},
   {:sku=>1725652},
   {:sku=>4530014},
   {:sku=>6748359}],
 :techSupportPlans=>[],
 :salesRankShortTerm=>nil,
 :salesRankMediumTerm=>nil,
 :salesRankLongTerm=>nil,
 :bestSellingRank=>nil,
 :url=>"http://www.bestbuy.com/site/sennheiser-camera-mount-wireless-microphone-system-black/9678429.p?id=1219427389475&skuId=9678429",
 :spin360Url=>nil,
 :mobileUrl=>"http://www.bestbuy.com/site/sennheiser-camera-mount-wireless-microphone-system-black/9678429.p?id=1219427389475&skuId=9678429",
 :affiliateUrl=>nil,
 :addToCartUrl=>"http://www.bestbuy.com/site/olspage.jsp?id=pcmcat152200050035&type=category&cmp=RMX&ky=1wVyi51lGg8EleFnEA1p3089v5bSeZGwS&qvsids=9678429",
 :affiliateAddToCartUrl=>nil,
 :linkShareAffiliateUrl=>"",
 :linkShareAffiliateAddToCartUrl=>"",
 :upc=>"615104153868",
 :productTemplate=>"Dynamic_Microphones",
 :categoryPath=>
  [{:id=>"cat00000", :name=>"Best Buy"}, {:id=>"abcat0400000", :name=>"Cameras & Camcorders"}, {:id=>"abcat0410022", :name=>"Camcorder Accessories"}, {:id=>"pcmcat258000050011", :name=>"Microphones"}],
 :lists=>[],
 :customerReviewCount=>nil,
 :customerReviewAverage=>nil,
 :customerTopRated=>false,
 :format=>nil,
 :freeShipping=>true,
 :freeShippingEligible=>true,
 :inStoreAvailability=>false,
 :inStoreAvailabilityText=>"Store Pickup: Not Available",
 :inStoreAvailabilityUpdateDate=>"2016-02-01T18:10:18",
 :itemUpdateDate=>"2016-03-04T12:09:19",
 :onlineAvailability=>true,
 :onlineAvailabilityText=>"Shipping: Usually ships in 2 business days",
 :onlineAvailabilityUpdateDate=>"2016-02-01T18:10:18",
 :releaseDate=>nil,
 :shippingCost=>0.0,
 :shipping=>[{:ground=>0.0, :secondDay=>14.99, :nextDay=>21.99, :vendorDelivery=>""}],
 :shippingLevelsOfService=>
  [{:serviceLevelId=>1, :serviceLevelName=>"Standard", :unitShippingPrice=>0.0},
   {:serviceLevelId=>3, :serviceLevelName=>"Expedited", :unitShippingPrice=>14.99},
   {:serviceLevelId=>5, :serviceLevelName=>"Express", :unitShippingPrice=>21.99}],
 :specialOrder=>false,
 :shortDescription=>
  "SENNHEISER Camera-Mount Wireless Microphone System: Invisible clip-on microphone; sturdy metal housing; automatic frequency management; easy-to-read illuminated display; 4-level battery indicator; 626-668MHz frequency range",
 :class=>"DIGITAL CAMERA ACCY",
 :classId=>56,
 :subclass=>"SO CAMERA ACCY",
 :subclassId=>708,
 :department=>"PHOTO/COMMODITIES",
 :departmentId=>5,
 :buybackPlans=>[],
 :protectionPlans=>[],
 :productFamilies=>[],
 :description=>nil,
 :manufacturer=>"Sennheiser",
 :modelNumber=>"EW 112P G3-B",
 :image=>"http://images.bestbuy.com/BestBuy_US/images/products/9678/9678429_sa.jpg",
 :largeFrontImage=>"http://img.bbystatic.com/BestBuy_US/images/products/9678/9678429_sa.jpg",
 :mediumImage=>"http://images.bestbuy.com/BestBuy_US/images/products/9678/9678429fp.gif",
 :thumbnailImage=>"http://images.bestbuy.com/BestBuy_US/images/products/9678/9678429_s.gif",
 :largeImage=>"http://images.bestbuy.com/BestBuy_US/images/products/9678/9678429_sb.jpg",
 :alternateViewsImage=>nil,
 :angleImage=>nil,
 :backViewImage=>nil,
 :energyGuideImage=>nil,
 :leftViewImage=>nil,
 :accessoriesImage=>nil,
 :remoteControlImage=>nil,
 :rightViewImage=>nil,
 :topViewImage=>nil,
 :condition=>"New",
 :inStorePickup=>false,
 :friendsAndFamilyPickup=>false,
 :homeDelivery=>false,
 :quantityLimit=>3,
 :fulfilledBy=>"BestBuy.com",
 :bundledIn=>[],
 :color=>"Black",
 :depth=>"1\"",
 :dollarSavings=>0.0,
 :percentSavings=>"0.0",
 :tradeInValue=>"",
 :height=>"4\""}
end
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migration and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  config.before(:suite) do
     DatabaseCleaner.clean_with(:truncation)
   end

   config.before(:each) do
     DatabaseCleaner.strategy = :transaction
   end

   config.before(:each, :js => true) do
     DatabaseCleaner.strategy = :truncation
   end

   config.before(:each) do
     DatabaseCleaner.start
   end

   config.after(:each) do
     DatabaseCleaner.clean
   end
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end
