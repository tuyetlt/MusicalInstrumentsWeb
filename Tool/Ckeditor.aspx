<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ckeditor.aspx.cs" Inherits="Tool_Ckeditor" %>

<!DOCTYPE html>
<html>
        <head>
                <meta charset="utf-8">
                <title>CKEditor</title>
                <script src="https://cdn.ckeditor.com/4.5.2/full/ckeditor.js"></script>
        </head>
        <body>
                <textarea name="editor1"></textarea>
                <script>
                        CKEDITOR.replace( 'editor1' );
                </script>
        </body>
</html>