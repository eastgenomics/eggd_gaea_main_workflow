#!/bin/bash
# eggd_app

# Exit at any point if there is any error and output each line as it is executed (for debugging)
# -e = exit on error; -x = output each line that is executed to log; -o pipefail = throw an error if there's an error in pipeline
set -e -x -o pipefail

main() {
    # Install packages if required

    ## Download input files (individual or an array)
    # either all at once, in which case they are placed into separate folders
    dx-download-all-inputs --parallel
    # Each input is placed under its own subfolder "~/in/name_of_input_field/", named after the input field.
    # can be accessed by using $input_file_path variable or
    # $input_file_name equivalent to basename command,
    # $input_file_prefix filename without the extension
    #  also for array of files input, individual files are downloaded into subfolders
    # /in/input_file_array/0/file0 and /in/input_file_array/1/file1 and so on
    # in which case they have to be moved manually into the same folder, if needed
    mkdir input_files
    find ~/in/input_file_array -type f -name "*" -print0 | xargs -0 -I {} mv {} ~/input_files

    # or files can be downloaded one by one, specifying a name for them within the workstation
    dx download "$input_file" -o input_file_name

    

}