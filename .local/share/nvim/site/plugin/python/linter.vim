function! UsePythonLinter()

  let linters = [ "pylint", "flake8" ]

  echo "Available Linters:\n\n"

  let i = 1

  for linter in linters
    echo i . ": " . linter
    let i = i + 1
  endfor

  call inputsave()
  let option = input("\nWhich linter do you want to use: ")
  call inputrestore()

  echo "\n\n"

  if option == 1
    setlocal makeprg=pylint\ --enable-all-extensions\ --score=n\ --persistent=n\
          \ --jobs=0\ --max-line-length=99\ --expected-line-ending-format=LF\
          \ --notes=TODO\ --check-quote-consistency=y
  elseif option == 2
    setlocal makeprg=flake8\ --doctests\ --max-line-length\ 99\ --max-complexity\ 10
  else
    echo "Linter not on the list!"
    return
  endif

  lmake %

endfunction
