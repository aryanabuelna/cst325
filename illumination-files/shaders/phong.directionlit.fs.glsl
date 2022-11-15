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

    // float result = dot(normalizedLight, normalizedWorld);
    // float lambertTerm = max(result, 0.0);

    // vec3 N = normalize(normalizedWorld * vWorldNormal);
    // vec3 L = normalize( vWorldPosition - vTexcoords.xyz);
    // float dotprod = dot(N,L);
    // float lambert = max(dotprod, 0.0);


    vec3 N = normalize(vWorldNormal);
    vec3 L = normalize(normalizedWorld - normalizedLight);
    float lambert = max(dot(N, L),0.0);
    //loat lambert = max(dot(N,L),0.0);
  


    // specular contribution
    // todo #4 in world space, calculate the direction from the surface point to the eye (normalized)
    //vec3 spec = _ *  _ *max(normalizedLight*normalizedWorld, 0);

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
   // gl_FragColor = vec4(normalizedWorld, 1.0); // green ground 

    // gl_FragColor = vec4(lambertTerm, lambertTerm, lambertTerm, lambertTerm);  // grey ground but its blue or white only???
    //gl_FragColor = vec4(lambert, lambert,lambert,lambert);
    //gl_FragColor = vec4(lambert , 1.0,1.0,1.0);
    gl_FragColor = vec4(lambert , 0.0,0.0,0.0);

}

// EOF 00100001-10