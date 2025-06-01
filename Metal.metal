#include <metal_stdlib>
#include <SwiftUI/SwiftUI.h>
using namespace metal;

half3 palette( float t) {
    
    half3 a = half3(0.5,0.5,0.5);
    half3 b = half3(0.5,0.5,0.5);
    half3 c = half3(1.0,1.0,1.0);
    half3 d = half3(0.263,0.416,0.557);
    
    return a + b*cos( 6.28318 * (c*t+d));
}

[[ stitchable ]] half4 june2(float2 position, SwiftUI::Layer l, float4 boundingRect, float time) {
    
    float2 resolution = float2(boundingRect[2], boundingRect[3]);
    float2 uv = (position * 2.0 - resolution) / resolution.y;
    float2 uv0 = uv;
    half3 finalcolor = half3(0.0);
    
    float t = (time);
    
    for (float i = 0.0; i < 4.0; i++) {
        uv = fract(uv * 1.5) - 0.5;
        float d = length(uv) * exp(-length(uv0));
        
        half3 color = half3(palette(length(uv0) + i * .4 + t * .4));
        
        d = sin(d * 8 + t)/8;
        d = abs(d);
        d = pow(0.04 / d, 3);
        finalcolor += color * d;
    }
    
    return half4(finalcolor,1.0);
}
