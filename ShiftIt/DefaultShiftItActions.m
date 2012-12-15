/*
 ShiftIt: Resize windows with Hotkeys
 Copyright (C) 2010  Filip Krikava
 
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
 */

#import "DefaultShiftItActions.h"
#import "FMTDefines.h"

int offset_horiz=0;
int offset_vert=0;
const int pixel_size=5;

NSRect ShiftIt_Left(NSSize screenSize, NSRect windowRect) {
	NSRect r;
	
	r.origin.x = 0;
	r.origin.y = 0;
	
	r.size.width = (screenSize.width / 2)-offset_horiz;
	r.size.height = screenSize.height;
	
	return r;
}

NSRect ShiftIt_Right(NSSize screenSize, NSRect windowRect) {
	NSRect r;
	
	r.origin.x = (screenSize.width/2)-offset_horiz;
	r.origin.y = 0;
	
	r.size.width = (screenSize.width / 2)+offset_horiz;
	r.size.height = screenSize.height;

	return r;
}

NSRect ShiftIt_Top(NSSize screenSize, NSRect windowRect) {
	NSRect r;
	
	r.origin.x = 0;
	r.origin.y = 0;
	
	r.size.width = screenSize.width;
	r.size.height = (screenSize.height / 2)-offset_vert;
	
	return r;
}

NSRect ShiftIt_Bottom(NSSize screenSize, NSRect windowRect) {
	NSRect r;
	
	r.origin.x = 0;
	r.origin.y = (screenSize.height / 2)-offset_vert;
	
	r.size.width = screenSize.width;
	r.size.height = (screenSize.height / 2)+offset_vert;
	
	return r;
}

NSRect ShiftIt_TopLeft(NSSize screenSize, NSRect windowRect) {
	NSRect r;
	
	r.origin.x = 0;
	r.origin.y = 0;
	
	r.size.width = (screenSize.width / 2)-offset_horiz;
	r.size.height = (screenSize.height / 2)-offset_vert;
	
	return r;
}

NSRect ShiftIt_TopRight(NSSize screenSize, NSRect windowRect) {
	NSRect r;
	
	r.origin.x = (screenSize.width / 2)-offset_horiz;
	r.origin.y = 0;
	
	r.size.width = (screenSize.width / 2)+offset_horiz;
	r.size.height = (screenSize.height / 2)-offset_vert;
	
	return r;
}

NSRect ShiftIt_BottomLeft(NSSize screenSize, NSRect windowRect) {
	NSRect r;
	
	r.origin.x = 0;
	r.origin.y = (screenSize.height / 2)-offset_vert;
	
	r.size.width = (screenSize.width / 2)-offset_horiz;
	r.size.height = (screenSize.height / 2)+offset_vert;
	
	return r;
}

NSRect ShiftIt_BottomRight(NSSize screenSize, NSRect windowRect) {
	NSRect r;
	
	r.origin.x = (screenSize.width / 2)-offset_horiz;
	r.origin.y = (screenSize.height / 2)-offset_vert;
	
	r.size.width = (screenSize.width / 2)+offset_horiz;
	r.size.height = (screenSize.height / 2)+offset_vert;
	
	return r;
}

NSRect ShiftIt_FullScreen(NSSize screenSize, NSRect windowRect) {
	NSRect r;
	
	r.origin.x = 0;
	r.origin.y = 0;
	
	r.size.width = screenSize.width;
	r.size.height = screenSize.height;
	
	return r;
}

NSRect ShiftIt_Center(NSSize screenSize, NSRect windowRect) {
	NSRect r;
	
	r.origin.x = (screenSize.width / 2)-(windowRect.size.width / 2);
	r.origin.y = (screenSize.height / 2)-(windowRect.size.height / 2);	
	
	r.size = windowRect.size;
	
	return r;
}

NSRect ShiftIt_SizeL(NSSize screenSize, NSRect windowRect) {
	NSRect r;
	if (windowRect.size.width <= (screenSize.width-20) &&
		(windowRect.size.height >= (screenSize.height-42))) {

	if (windowRect.origin.x==0) { //Screen on the Left
		r.origin.x = 0;
		r.origin.y = 0;
		
		r.size.width = (screenSize.width /2)-(offset_horiz+=pixel_size);
		r.size.height = windowRect.size.height;
	} else { //Screen on the Right
		r.origin.x = (screenSize.width/2)-(offset_horiz+=pixel_size);
		r.origin.y = 0;
	
		r.size.width = (screenSize.width / 2)+offset_horiz;
		r.size.height = windowRect.size.height;
	}
	} else {
		r.origin.x = windowRect.origin.x;
		r.origin.y = windowRect.origin.y-22;
		
		r.size.width = windowRect.size.width;
		r.size.height = windowRect.size.height;
	}
	
	return r;
	
}

NSRect ShiftIt_SizeR(NSSize screenSize, NSRect windowRect) {
	NSRect r;
	if (windowRect.size.width <= (screenSize.width-20) &&
		(windowRect.size.height >= (screenSize.height-42))) {
		if (windowRect.origin.x==0) { //Screen on left 
			r.origin.x = 0;
			r.origin.y = 0;

			r.size.width = (screenSize.width / 2)-(offset_horiz-=pixel_size);
			r.size.height = windowRect.size.height;
		} else {
			r.origin.x = (screenSize.width / 2)-(offset_horiz-=pixel_size);
			r.origin.y = 0;

			r.size.width = (screenSize.width / 2)+offset_horiz;
			r.size.height = windowRect.size.height;
		}
	} else {
		r.origin.x = windowRect.origin.x;
		r.origin.y = windowRect.origin.y-22;
		
		r.size.width = windowRect.size.width;
		r.size.height = windowRect.size.height;
	}
	
	return r;
}

NSRect ShiftIt_SizeU(NSSize screenSize, NSRect windowRect) {
	NSRect r;

	if (windowRect.size.height <= (screenSize.height-42) &&
		(windowRect.size.width >= (screenSize.width-20))) {
		if (windowRect.origin.y<=22) { //Screen on the Top
			r.origin.x = 0;
			r.origin.y = 0;

			r.size.width = windowRect.size.width;
			r.size.height = (screenSize.height /2)-(offset_vert+=pixel_size);
		} else {
			r.origin.x = 0;
			r.origin.y = (screenSize.height / 2)-(offset_vert+=pixel_size);

			r.size.width = windowRect.size.width;
			r.size.height = (screenSize.height / 2)+(offset_vert);
		}
	} else {
		r.origin.x = windowRect.origin.x;
		r.origin.y = windowRect.origin.y-22;

		r.size.width = windowRect.size.width;
		r.size.height = windowRect.size.height;
	}
		
	return r;
}

NSRect ShiftIt_SizeD(NSSize screenSize, NSRect windowRect) {
	NSRect r;
	
	if ((windowRect.size.height <= (screenSize.height-42)) &&
		(windowRect.size.width >= (screenSize.width-20))) {
		if (windowRect.origin.y<=22) { //Screen on the Top
			r.origin.x = 0;
			r.origin.y = 0;

			r.size.width = windowRect.size.width;
			r.size.height = (screenSize.height /2)-(offset_vert-=pixel_size);
		} else {
			r.origin.x = 0;
			r.origin.y = (screenSize.height / 2)-(offset_vert-=pixel_size);

			r.size.width = windowRect.size.width;
			r.size.height = (screenSize.height / 2)+(offset_vert);
		}
	} else {
		r.origin.x = windowRect.origin.x;
		r.origin.y = windowRect.origin.y-22;
		
		r.size.width = windowRect.size.width;
		r.size.height = windowRect.size.height;
	}
	
	return r;
}

