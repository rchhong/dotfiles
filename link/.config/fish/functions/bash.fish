function bashfish --description "Attempts to run a bash script with utilities support.  May need to use bass if this fails"
    exec bash -c "source $argv; exec fish"
end
