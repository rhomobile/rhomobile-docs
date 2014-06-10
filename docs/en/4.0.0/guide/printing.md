# Printing

## Printing on iOS
Printing on iOS is supported by the OS itself. Before printing, you should open the file and make sure to perform any changes necessary before printing. To open the file, use the System module's [open_url method](../api/system#mopenUrl).

	:::ruby
	System.open_url(file_full_path)

We recommend the use of the PDF file format when printing. See below for details on [generating PDFs](#generating-pdfs) of your files to be printed.

## Printing on Android
Android does not support printing but, you can use any third-party application for printing. For example, the Google Cloud Printing application can print by using the Google Cloud Print web service.

Before printing, you should open the file and make sure to perform any changes necessary before printing. To open the file, use the System module's [open_url method](../api/system#mopenUrl).

	:::ruby
	System.open_url(file_full_path)

The Android OS opens the file in whatever application is registered for the file's extension, or it shows a chooser for manual selection of an application if there are more than one application registered for the aforementioned extension.

We recommend the use of the PDF file format when printing. See below for details on [generating PDFs](#generating-pdfs) of your files to be printed.

## Generating PDFs
You can use the 'pdf-writer' Ruby library, which we include in Rhodes, to generate the PDF of your file to be printed. Just include the "pdf-writer" and "thread" extensions into your application's extension list in the build.yml:

`/build.yml`

	:::yaml
	extensions: ["pdf-writer", "thread"] 

There is an example of this in our [System API Samples application Generate PDF example](http://github.com/rhomobile/rhodes-system-api-samples/tree/master/app/GeneratePDF/controller.rb) application.