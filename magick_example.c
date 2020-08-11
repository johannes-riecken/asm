// Last updated 2008/11/04 10:53

// A simple example equivalent to
// convert logo: logo.jpg

#include <windows.h>
#include <wand/magick_wand.h>

void test_wand(void)
{
	MagickWand *mw = NULL;

	MagickWandGenesis();

	/* Create a wand */
	mw = NewMagickWand();

	/* Read the input image */
	MagickReadImage(mw,"logo:");
	/* write it */
	MagickWriteImage(mw,"logo.jpg");

	/* Tidy up */
	if(mw) mw = DestroyMagickWand(mw);

	MagickWandTerminus();
}
