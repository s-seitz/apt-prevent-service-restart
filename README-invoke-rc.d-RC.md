
## LSB-conform Returncodes for invoke-rc.d

### 0
either the init script was run and returned exit status 0 (note
that a fallback action may have been run instead of the one given
in the command line), or it was not run because of runlevel/local
policy constrains and --disclose-deny is not in effect.

### 1 - 99
**reserved** for init.d script
 
### 100
i**nit script ID (basename) unknown**
init script not registered sucessfully through 
update-rc.d or init script does not exist.
This error is fatal for most initscript systems.

### 101
**action not allowed**
requested action will not be performed because of 
runlevel or local policy constrains, and 
--disclose-deny is in effect. Note that a fallback
action is NOT considered "action not allowed",
unless --nofalback is in effect.

### 102
**subsystem error**
initscript (or policy) subsystem malfuncion.
(e.g. broken /sbin/runlevel).
Also, forced initscript execution due to 
--try-anyway or --force failed.

### 103
**syntax error**

### 104
**action allowed**
--query is in effect; init script would be run if

### 105
not for --query.
Behaviour uncertain
cannot determine if action should be carried out or 
not, and --query in effect.

### 106
**fallback action requested**
the policy layer denied the requested action, and
supplied an allowed fallback action.
