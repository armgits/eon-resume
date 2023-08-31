#!/bin/ash

set -e

# function definition for installing the package files
installer()
{
  for filename in ./*; do
    file_extension="${filename##*.}"

    if [[ $file_extension == cls ]]; then
      mv "${filename}" ~/texmf/tex/latex/"${package_directory}"
    fi

    if [[ $file_extension == sty ]]; then
      mv "${filename}" ~/texmf/tex/latex/"${package_directory}"
    fi

    if [[ $file_extension == pdf ]]; then
      if [ ! -d ~/texmf/doc/"${directory_name}" ]; then
        mkdir -p ~/texmf/doc/"${directory_name}"
      fi
      
      mv "${filename}" ~/texmf/doc/"${package_directory}"
    fi
  done
}

# create local packages package_directory
mkdir -p ~/texmf/tex/latex

# create documentation package_directory
mkdir -p ~/texmf/doc

# loop through the latex packages folder and install the packages within them
mkdir ~/tmp
cp -r ~/resume/.devcontainer/latex-packages ~/tmp
cd ~/tmp/latex-packages

for package_directory in */; do
  cd "$package_directory"

  directory_name="${package_directory%/}"

  if [ -f "${directory_name}".ins ]; then  
    latex "${directory_name}".ins
  fi
  
  mkdir -p ~/texmf/tex/latex/"${directory_name}"
    
  # if [ -f "${directory_name}".cls ]; then
  #   mv "${directory_name}".cls ~/texmf/tex/latex/"${package_directory}"
  # fi

  # if [ -f "${directory_name}".sty ]; then
  #   mv "${directory_name}".sty ~/texmf/tex/latex/"${package_directory}"
  # fi
    
  # if [ -f "${directory_name}".pdf ]; then
  #   mkdir -p ~/texmf/doc/"${directory_name}"
  #   mv "${directory_name}".pdf ~/texmf/doc/"${package_directory}"
  # fi
  
  installer

  cd ..
done

rm -r ~/tmp

  