$env:ChocolateyInstall ->
    chooks ->
        pre-install ->
            global ->
                hookName1.ps1
                hookName2.ps1
            packageId1 ->
                hookName1.ps1
                hookName2.ps1
            packageId1 ->
                hookName1.ps1
                hookName2.ps1
        pre-modify
            global ->
                hookName1.ps1
                hookName2.ps1
            packageId1 ->
                hookName1.ps1
                hookName2.ps1
            packageId1 ->
                hookName1.ps1
                hookName2.ps1
        pre-uninstall
            global ->
                hookName1.ps1
                hookName2.ps1
            packageId1 ->
                hookName1.ps1
                hookName2.ps1
            packageId1 ->
                hookName1.ps1
                hookName2.ps1
        post-install
            global ->
                hookName1.ps1
                hookName2.ps1
            packageId1 ->
                hookName1.ps1
                hookName2.ps1
            packageId1 ->
                hookName1.ps1
                hookName2.ps1
        post-modify
            global ->
                hookName1.ps1
                hookName2.ps1
            packageId1 ->
                hookName1.ps1
                hookName2.ps1
            packageId1 ->
                hookName1.ps1
                hookName2.ps1
        post-uninstall
            global ->
                hookName1.ps1
                hookName2.ps1
            packageId1 ->
                hookName1.ps1
                hookName2.ps1
            packageId1 ->
                hookName1.ps1
                hookName2.ps1
        all ->   
            global ->
                hookName1.ps1
                hookName2.ps1
            packageId1 ->
                hookName1.ps1
                hookName2.ps1
            packageId1 ->
                hookName1.ps1
                hookName2.ps1
        