#!/bin/sh
# LaunchTrimmer.command: Remove unwanted applications from Launchpad in OS X 10.7
# Copyright 2011 Keegan Quinn
# License: MIT

# Prompt the user for the name of an application to remove.
echo "Type the name of an application to remove from Launchpad:"
read TRIM

# Variables for paths. This might do the wrong thing if there are multiple .db
# files under Library/Application Support/Dock; hopefully that never happens.
REAL_DB_PATH=`ls $HOME/Library/Application\ Support/Dock/*.db | head -1`
BACKUP_DB_PATH="$REAL_DB_PATH.bak"
EDIT_DB_PATH="$REAL_DB_PATH.edit"

# Make a backup copy of the database, and a copy for editing.
cp "$REAL_DB_PATH" "$BACKUP_DB_PATH"
cp "$REAL_DB_PATH" "$EDIT_DB_PATH"

# Informational message.
echo ""
echo "The following apps will be removed from Launchpad:"

# Display all of the rows in the 'apps' table in the database which match
# our app name. These are going to be deleted.
sqlite3 "$EDIT_DB_PATH" "SELECT * FROM apps WHERE title LIKE '%$TRIM%'"

# Confirm before actually changing anything.
echo ""
echo "Press enter to confirm or control-C to cancel."
read

# Delete rows from the 'items' and 'apps' tables which match our app name.
sqlite3 "$EDIT_DB_PATH" "DELETE FROM items WHERE rowid IN (SELECT item_id FROM apps WHERE title LIKE '%$TRIM%')"
sqlite3 "$EDIT_DB_PATH" "DELETE FROM apps WHERE title LIKE '%$TRIM%'"

# Move the edited version of the database over the original version.
mv "$EDIT_DB_PATH" "$REAL_DB_PATH"

# Kill the Dock process; it will be restarted automatically, and will notice the
# changes to the database at that time.
killall Dock

# We're done.
exit 0
