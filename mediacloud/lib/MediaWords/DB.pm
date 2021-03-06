package MediaWords::DB;

use strict;

# Copy this file to lib/MediaWords/DB.pm and then edit CONNECT_INFO

# Replace DATABASENAME, HOSTNAME, USERNAME, and PASSWORD with the appropriate values to connect to your postgresql database
use constant CONNECT_INFO => (
        'dbi:Pg:dbname=mediacloud;host=localhost',
        'mediaclouduser',
        'changeme',
        {AutoCommit => 1, 
         RaiseError => 1}
    );

my $_session_connect_info;

# set or return the connect info.  if an argument is passed, reset the connect info to the new value.
# if the argument is 'default', reset to the default connect info
sub connect_info {
    my ( $session_connect_info ) = @_;
    
    if ( $session_connect_info )
    {
        if ( $session_connect_info eq 'default' )
        {
            $_session_connect_info = undef;
        }
        else {
            $_session_connect_info = $session_connect_info;
        }
    }
    
    if ( $_session_connect_info ) 
    {
        return @{ $_session_connect_info };
    }
    else {
        return CONNECT_INFO;
    }
}
    
sub authenticate {
    return __PACKAGE__->connect(CONNECT_INFO);
}


# You can replace this text with custom content, and it will be preserved on regeneration
1;
