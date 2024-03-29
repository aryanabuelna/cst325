precision mediump float;

uniform vec3 uLightDirection;
uniform vec3 uCameraPosition;
uniform sampler2D uTexture;

varying vec2 vTexcoords;
varying vec3 vWorldNormal;
varying vec3 vWorldPosition;

void main(void) {
    // diffuse contribution
    // todo #1 normalize the light direction and store in a separate variable
    vec3 normalizedLight = normalize(uLightDirection);

    // todo #2 normalize the world normal and store in a separate variable
    vec3 normalizedWorld = normalize(vWorldNormal);

    // todo #3 calculate the lambert term
    float result = dot(normalizedWorld ,normalizedLight);
    float r1 = max(result, 0.0);


    // specular contribution
    // todo #4 in world space, calculate the direction from the surface point to the eye (normalized)
   
   //vec3 r =  normalizedWorld - normalizedLight;
    // vec3 spec = dot(normalizedWorld, normalizedLight) * r ;
    
    vec3 eyeVec = -(vWorldPosition - uCameraPosition);
    eyeVec = normalize(eyeVec);

    // todo #5 in world space, calculate the reflection vector (normalized)
    // todo #6 calculate the phong term

    // combine
    // todo #7 apply light and material interaction for diffuse value by using the texture color as the material
    // todo #8 apply light and material interaction for phong, assume phong material color is (0.3, 0.3, 0.3)


    vec3 albedo = texture2D(uTexture, vTexcoords).rgb;

    vec3 ambient = albedo * 0.1;
    // vec3 diffuseColor = todo
    // vec3 specularColor = todo

    // todo #9
    // add "diffuseColor" and "specularColor" when ready
    vec3 finalColor = ambient; // + diffuseColor + specularColor;

   //gl_FragColor = vec4(finalColor, 1.0); // original code
   //gl_FragColor = vec4(uLightDirection, 1.0); // yellow ground
   //gl_FragColor = vec4(normalizedLight, 1.0); // orange ground
   //gl_FragColor = vec4(normalizedWorld, 1.0); // green ground 

    //gl_FragColor = vec4( r1, r1, r1, 1.0); // grey ground

    gl_FragColor = vec4( eyeVec, 1.0); // gradient green blue ground
}

// EOF 00100001-10