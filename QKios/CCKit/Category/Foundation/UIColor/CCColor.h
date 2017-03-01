//
//  CCColor.h
//  QKios
//
//  Created by sunny on 2017/3/1.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

#ifndef CCColor_h
#define CCColor_h


#import "UIColor+CCHex.h"
#import "UIColor+CCRandom.h"
#import "UIColor+CCGradient.h"


//Hex 色
#define HexColor(hexString) [UIColor colorWithHexString:(hexString)]

//随机色
#define RandomColor [UIColor randomColor]

#define RGB(R,G,B) [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:1.0]

#define RGBA(R,G,B,A) [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A/100.0]














#endif /* CCColor_h */
