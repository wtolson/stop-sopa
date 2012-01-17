SERVER=$2
DIR=$3


case "$1" in
    'activate')
        rsync -vrtPzhb --suffix=.bkup .htaccess stop-sopa.html $SERVER:$DIR
    ;;

    'deactivate')
        ssh $SERVER "[ -e $DIR/.htaccess ] && [ -e $DIR/.htaccess.bkup ] && mv .htaccess .htaccess_sopa; [ -e $DIR/.htaccess.bkup ] && mv .htaccess.bkup .htaccess"
    ;;

    *)
        echo "Usage: $0 [activate|deactivate] SERVER DIR"
    ;;
esac
