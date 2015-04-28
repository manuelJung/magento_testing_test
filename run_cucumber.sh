#load sauceaccess
export SAUCE_USERNAME=cucumber01
export SAUCE_ACCESS_KEY=045ec379-6ef2-4fc8-bdac-a57630230bc1



if [ $# = 4 ] ; then
cucumber MAGENTO_USERNAME=${2} MAGENTO_PASSWORD=${3} features/${1}/features -r features/${1}/step_definitions/ -r features/${1}/support/ -r features/support/ -t ${4};
else
cucumber MAGENTO_USERNAME=${2} MAGENTO_PASSWORD=${3} features/${1}/features -r features/${1}/step_definitions/ -r features/${1}/support/ -r features/support/;
fi