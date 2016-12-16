//
//  CGPDFDocument.m
//  ExperienceCluster
//
//  Created by Roy Miller on 16/12/16.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "CGPDFDocument.h"


CGPDFDocumentRef MyGetPDFDocumentRef (const char *filename)
{
    CFStringRef path;
    CFURLRef url;
    CGPDFDocumentRef document;
    size_t count;
    
    path = CFStringCreateWithCString (NULL, filename,
                                      kCFStringEncodingUTF8);
    url = CFURLCreateWithFileSystemPath (NULL, path, // 1
                                         kCFURLPOSIXPathStyle, 0);
    CFRelease (path);
    document = CGPDFDocumentCreateWithURL (url);// 2
    CFRelease(url);
    count = CGPDFDocumentGetNumberOfPages (document);// 3
    if (count == 0) {
        printf("`%s' needs at least one page!", filename);
        return NULL;
    }
    return document;
}

void MyDisplayPDFPage (CGContextRef myContext,
                       size_t pageNumber,
                       const char *filename)
{
    CGPDFDocumentRef document;
    CGPDFPageRef page;
    
    document = MyGetPDFDocumentRef (filename);// 1
    page = CGPDFDocumentGetPage (document, pageNumber);// 2
    CGContextDrawPDFPage (myContext, page);// 3
    CGPDFDocumentRelease (document);// 4
}

void MyDrawPDFPageInRect (CGContextRef context,
                          CGPDFPageRef page,
                          CGPDFBox box,
                          CGRect rect,
                          int rotation,
                          bool preserveAspectRatio)
{
    CGAffineTransform m;
    
    m = CGPDFPageGetDrawingTransform (page, box, rect, rotation,// 1
                                      preserveAspectRatio);
    CGContextSaveGState (context);// 2
    CGContextConcatCTM (context, m);// 3
    CGContextClipToRect (context,CGPDFPageGetBoxRect (page, box));// 4
    CGContextDrawPDFPage (context, page);// 5
    CGContextRestoreGState (context);// 6
}

void MyCreatePDFFile (CGContextRef context , CGRect pageRect, const char *filename)// 1
{
    CGContextRef pdfContext;
    CFStringRef path;
    CFURLRef url;
    CFDataRef boxData = NULL;
    CFMutableDictionaryRef myDictionary = NULL;
    CFMutableDictionaryRef pageDictionary = NULL;
    
    path = CFStringCreateWithCString (NULL, filename, kCFStringEncodingUTF8);
    url = CFURLCreateWithFileSystemPath (NULL, path, kCFURLPOSIXPathStyle, 0);
    CFRelease (path);
    myDictionary = CFDictionaryCreateMutable(NULL, 0,
                                             &kCFTypeDictionaryKeyCallBacks,
                                             &kCFTypeDictionaryValueCallBacks); // 4
    CFDictionarySetValue(myDictionary, kCGPDFContextTitle, CFSTR("My PDF File"));
    CFDictionarySetValue(myDictionary, kCGPDFContextCreator, CFSTR("My Name"));
    pdfContext = CGPDFContextCreateWithURL (url, &pageRect, myDictionary); // 5
    CFRelease(myDictionary);
    CFRelease(url);
    pageDictionary = CFDictionaryCreateMutable(NULL, 0,
                                               &kCFTypeDictionaryKeyCallBacks,
                                               &kCFTypeDictionaryValueCallBacks); // 6
    boxData = CFDataCreate(NULL,(const UInt8 *)&pageRect, sizeof (CGRect));
    CFDictionarySetValue(pageDictionary, kCGPDFContextMediaBox, boxData);
    CGPDFContextBeginPage (pdfContext, pageDictionary); // 7
    //    myDrawContent (pdfContext);// 8
    CGPDFContextEndPage (pdfContext);// 9
    CGContextRelease (pdfContext);// 10
    CFRelease(pageDictionary); // 11
    CFRelease(boxData);
}

@implementation CGPDFDocument

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [[UIColor whiteColor] setFill];
    CGContextFillRect(context, rect);
    
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    NSString *string = [[NSBundle mainBundle] pathForResource:@"test.pdf" ofType:nil];
    
    MyDisplayPDFPage(context, 1, [string UTF8String]);
}

@end
