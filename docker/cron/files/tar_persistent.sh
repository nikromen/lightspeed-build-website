#!/usr/bin/sh

if [ -z "$FEEDBACK_DIR" ] || [ -z "$STORAGE_DIR" ]; then
    echo "Please define FEEDBACK_DIR and STORAGE_DIR"
    exit 1
elif [ ! -d "$FEEDBACK_DIR" ] || [ ! -d "$STORAGE_DIR" ]; then
    echo "Make sure the following directories exist:"
    echo "$FEEDBACK_DIR"
    echo "$STORAGE_DIR"
    exit 1
fi

# archive results tar_persistent.sh and remove the old ones
FILE_NAME=data-$(date +%s).tar.gz
tar -czvf $STORAGE_DIR/new-$FILE_NAME -C $FEEDBACK_DIR . && \
    rm -f $STORAGE_DIR/data-*.tar.gz && \
    mv $STORAGE_DIR/new-$FILE_NAME $STORAGE_DIR/$FILE_NAME
