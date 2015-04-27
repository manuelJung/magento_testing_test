#load sauceaccess
export SAUCE_USERNAME=emsauce03
export SAUCE_ACCESS_KEY=85becac9-b3b1-4c6b-b2f5-ccf806fb8a98


if [ $# = 2 ] ; then
cucumber features/${1}/features -r features/${1}/step_definitions/ -r features/support/ -t ${2};
else
cucumber features/${1}/features -r features/${1}/step_definitions/ -r features/support/;
fi