function create-empty-notebook --description "Create an empty Jupyter notebook from a temp Python file"
    set temp_file "$argv[1].py"
    set notebook "$argv[1].ipynb"

    touch $temp_file
    micromamba run -a "" -n base jupytext $temp_file -o $notebook --to notebook --set-kernel $argv[2]
    rm $temp_file
end
