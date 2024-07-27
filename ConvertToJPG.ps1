# Get all image files in the current folder and subfolders
$imageFiles = Get-ChildItem -Recurse -Include *.png,*.bmp,*.tiff,*.gif

# Loop through each image file
foreach ($file in $imageFiles) {
    # Create the new file name with .jpg extension
    $newFileName = [System.IO.Path]::ChangeExtension($file.FullName, "jpg")
    
    # Load the image
    $image = [System.Drawing.Image]::FromFile($file.FullName)
    
    # Save the image as JPG
    $image.Save($newFileName, [System.Drawing.Imaging.ImageFormat]::Jpeg)
    
    # Dispose of the image object
    $image.Dispose()
    
    Write-Host "Converted: $($file.Name) to $([System.IO.Path]::GetFileName($newFileName))"
}

Write-Host "Conversion complete!"