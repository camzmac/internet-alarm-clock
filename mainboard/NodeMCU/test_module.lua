local module =...
return function()
    local test_var=1
    test_var=test_var*2
    test_var=test_var*2
    test_var=test_var*2

    package.loaded[module] = nil
    --module = nil
    
    return test_var
end