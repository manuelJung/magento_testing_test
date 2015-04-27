#load sauceaccess
export SAUCE_USERNAME=cucumber01
export SAUCE_ACCESS_KEY=045ec379-6ef2-4fc8-bdac-a57630230bc1

export MAGENTO_USERNAME=username_for_magento_access
export MAGENTO_PASSWORD=password_for_magento_access


if [ $# = 2 ] ; then
cucumber features/${1}/features -r features/${1}/step_definitions/ -r features/${1}/support/ -r features/support/ -t ${2};
else
cucumber features/${1}/features -r features/${1}/step_definitions/ -r features/${1}/support/ -r features/support/;
fi