function disable_pycompss {
  init_file=$(python3 -c "import permedcoe; print(permedcoe.__file__)")
  sed -i 's/\# raise/raise/g' ${init_file}
}

function enable_pycompss {
  init_file=$(python3 -c "import permedcoe; print(permedcoe.__file__)")
  sed -i 's/raise/\# raise/g' ${init_file}
}
