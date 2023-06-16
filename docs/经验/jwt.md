---
created: 2023-05-17
share: true
category: 经验
title: JWT
---

### Intro
JSON Web Tokens (JWTs) are a compact, URL-safe means of representing claims to be transferred between two parties. They are often used for authentication and information exchange. Here's a basic breakdown of how JWTs work:

1. **Claim Definition**: Claims are statements about an entity (typically, the user) and additional data. There are three types of claims: registered, public, and private claims. A claim might include information like the identity of the user, the user's authorization level, and when the token was issued.

2. **Token Creation**: After the claims are defined, a JSON object is created and converted to a JSON Web Token. This is a three-part process:
    - **Header**: The header typically consists of two parts: the type of the token, which is JWT, and the signing algorithm being used, such as HMAC SHA256 or RSA.
    - **Payload**: The second part of the token is the payload, which contains the claims.
    - **Signature**: The signature is created by encoding the header and payload using Base64Url, joining them with a period, and then applying the defined algorithm to this string along with a secret key. The resulting string is the signature.

3. **Token Transmission**: The token is then sent to the client, typically in the header of an HTTP response for an authentication request.

4. **Token Use**: The client stores the token and includes it in the header of subsequent requests to the server. This allows the server to authenticate the client without requiring the client to resend login information.

5. **Token Verification**: Upon receiving a request with a JWT, the server can verify the token's authenticity and integrity. The server decodes the JWT and verifies the signature using the same secret key that was used to create the signature. If the signature verification is successful, the server trusts the claims in the payload.

6. **Token Expiration**: JWTs often include an expiration claim, which prevents them from being used indefinitely. The server will check the expiration claim if one is present and will not accept the token if it has expired.

By using JWTs, servers can authenticate clients, and clients can authenticate servers. JWTs provide a way to carry information between parties in a web-safe manner. However, it's important to note that while the information in a JWT can be verified to have come from a trusted source, it is not encrypted, so it should not be used to transmit sensitive information unless additional encryption measures are used.

### URL-safe
"URL-safe" refers to a format that can be transmitted reliably in a URL without encoding or decoding, or causing any issues due to reserved or special characters.

In the context of URLs, certain characters have special meanings, such as "?", "#", "/", "&", ":", "%", "+", and "=" among others. For example, the "?" is used to start the query string in a URL, and "=" and "&" are used within the query string to denote key-value pairs.

When data is URL-safe, it means that it doesn't contain any of these special characters that might confuse the URL parsing. It is typically achieved by percent-encoding special characters, converting them into a format that can be included in a URL without causing issues.

For example, a space character is not URL-safe because it could break the URL parsing. In a URL-safe format, a space would typically be replaced with a "+", or "%20" in percent encoding.

In the context of JSON Web Tokens (JWT), being "URL-safe" means that the tokens are designed to be conveyed in URLs without any encoding/decoding, and without introducing any parsing issues. This is typically achieved by using a variant of Base64 encoding called Base64url that substitutes the "+" and "/" characters of standard Base64 with "-" and "_" respectively, making it safe for use in URLs.

### 相似的技术
JSON Web Tokens (JWT) are a popular method for handling user authentication and authorization, but they're not the only approach. Here are a few other alternatives that can be used to achieve similar results:

1. **Session-Based Authentication**: This is a traditional method of handling user state. Upon login, the server creates a new session for the user in the server memory and then sends back a session ID to the client, typically in a cookie. For subsequent requests, the client sends back the session ID, and the server uses it to fetch the session data and perform authentication.

2. **OAuth**: OAuth 2.0 is an open standard for access delegation, often used as a way for Internet users to grant websites or applications access to their information on other websites without giving them the passwords. OAuth essentially allows the client application to borrow the identity and permissions of the user to make API requests on their behalf.

3. **SAML (Security Assertion Markup Language)**: SAML is a set of standards for exchanging authentication and authorization data between parties. It's primarily used for Single Sign-On (SSO) between web domains. SAML uses XML for encoding its assertions.

4. **OpenID Connect**: OpenID Connect is a simple identity layer on top of the OAuth 2.0 protocol. It allows clients to verify the identity of the end-user based on the authentication performed by an authorization server, as well as to obtain basic profile information about the end-user in an interoperable and REST-like manner.

5. **API Keys**: An API key is a token that a client provides when making API calls. The key identifies the client, and the server might use the key to look up all sorts of associated metadata. But unlike JWTs, API keys don't contain "claims" and are not signed by the server; they are more like database keys.

Remember, the choice of authentication mechanism depends on the use case, the type of application, the security requirements, and other factors.

### SSO SAML
Single Sign-On (SSO) using Security Assertion Markup Language (SAML) allows a user to log in once and gain access to multiple systems without being prompted to log in again at each of them. Here's a simple description of how the process works:

1. **User Request**: The user attempts to access a resource, also known as a service provider (SP). If the user is not already authenticated, the service provider generates a SAML authentication request. This request is then encoded and embedded into a URL, which redirects the user to an identity provider (IdP).

2. **Identity Provider Verification**: The identity provider decodes the SAML request and authenticates the user. This could be done through a username/password prompt, multi-factor authentication, or any number of methods.

3. **Assertion Creation**: Once the identity provider authenticates the user, it generates a SAML assertion. This assertion contains XML-based statements about the user's identity, and it may also contain additional information, like the user's email or role. The assertion is then encoded and embedded into a form, which is auto-submitted via the user's browser back to the service provider.

4. **Service Provider Verification**: The service provider decodes the SAML response and verifies the assertion. If everything checks out, the service provider establishes a session for the user, and the user is granted access to the requested resource.

5. **User Access**: Once logged in, the user can access other service providers that trust the same identity provider without having to authenticate again. The established session serves as proof of the user's authentication.

The beauty of SSO using SAML is that it separates the role of providing an authentication service from the role of providing the resources the user wants to access. This allows one set of login credentials to be used across multiple applications, reducing the need for remembering multiple usernames and passwords.

#### HTML form create process
Sure, let's walk through the process of how the HTML form is created during a SAML-based Single Sign-On process:

1. After a user has been authenticated by the Identity Provider (IdP), the IdP constructs a SAML Response. This response contains a SAML Assertion, which is an XML document that includes statements about the user's identity, attributes, and authentication status.

2. The IdP then digitally signs the SAML Assertion to ensure its integrity and authenticity.

3. The signed SAML Assertion is then encoded, usually using Base64 encoding. This encoding allows the XML document to be transmitted as simple text.

4. The IdP creates an HTML form. The action attribute of the form is set to the Service Provider's (SP's) Assertion Consumer Service (ACS) URL, which is where the form will be automatically submitted.

5. The encoded SAML Assertion is embedded within this HTML form as a hidden input field. This means it's part of the form data, but it's not visible to the user in their browser.

6. The HTML form also includes a script that automatically submits the form. This could be a simple JavaScript that calls the form's submit method when the page loads.

7. The HTML form (containing the encoded SAML Assertion) is sent back to the user's browser, typically as part of an HTTP response.

8. When the user's browser receives this HTML page, the JavaScript on the page automatically submits the form to the SP's ACS URL. This POST request includes the encoded SAML Assertion as part of the form data.

9. The SP receives the form data, decodes the SAML Assertion, and verifies it. If everything checks out, the SP creates a new session for the user, and the user is granted access to the requested resource.

This process allows the SAML Assertion to be securely and reliably transmitted from the IdP to the SP, even though it's going through the user's browser. It's part of the SAML Web Browser SSO Profile, which is designed to enable SSO for web-based applications.

### OAuth
OAuth 2.0 (Open Authorization) is a protocol that allows a user to grant a third-party web site or application access to their protected resources, without necessarily revealing their long-term credentials or even their identity. Here is a simple step-by-step explanation of the OAuth 2.0 flow, specifically the Authorization Code Grant, which is commonly used for web server applications:

1. **Authorization Request**: The client (often a web server) redirects the user to the authorization server (usually a web page). The redirection includes query parameters that indicate the type of access being requested, the client's identifier, and a redirection URI to which the authorization server will send the user once access is granted (or denied).

2. **User Login**: The user authenticates with the authorization server (usually by logging in). The authorization server then validates the client and the access requested.

3. **User Consent**: The user must then grant the requested access. This is usually accomplished through a dialog box on the authorization server's site that describes the access the client is requesting, and prompts the user to approve or deny the request.

4. **Authorization Code Grant**: If the user grants access, the authorization server redirects the user back to the client using the redirection URI provided earlier. The redirection includes an authorization code.

5. **Authorization Code Exchange**: The client then sends a request to the authorization server to exchange the authorization code for an access token. This request includes the client's identifier and secret, along with the redirection URI and the authorization code received in the previous step. The authorization server validates this information and responds with an access token (and optionally, a refresh token).

6. **Resource Request**: The client can now use the access token to request the protected resources (such as user data) from the resource server (often an API).

7. **Resource Response**: The resource server validates the access token, and if valid, serves the requested resources to the client.

Remember that this is just one flow (the Authorization Code Grant) of OAuth 2.0. There are other flows available for different types of clients (e.g., Implicit Grant for public clients or Client Credentials Grant when client is also the resource owner), but this one is the most commonly used.

#### Why Authorization Code
The primary reason the authorization server initially responds with an Authorization Code rather than an Access Token and Refresh Token is for security reasons, particularly in cases where the client (application requesting access) is a web server.

Here's why:

1. **Separation of roles**: In the Authorization Code flow, the user agent (e.g., web browser) never gets access to the access token or refresh token. Instead, it only gets an authorization code which can't be used on its own to access protected resources. This is important because user agents often run in less secure environments where tokens could be more easily compromised.

2. **Client authentication**: When the client exchanges the authorization code for an access token and refresh token, it also authenticates itself with the authorization server by providing its client ID and client secret. This helps ensure that only the legitimate, registered client can obtain tokens, even if an authorization code is intercepted or leaked.

3. **One-time use**: The authorization code is short-lived and can be used exactly once. This limits the potential for abuse if the code is intercepted during the redirection back to the client.

4. **Mitigate CSRF attacks**: The client should generate and store a random "state" parameter before initiating an authorization request, which will be sent back by the server with the authorization code. This can be used to validate the response, as well as to mitigate cross-site request forgery (CSRF) attacks.

While there are other OAuth 2.0 flows that do provide an access token directly (like the Implicit Grant flow), they are used in situations where the client cannot keep a secret (like a JavaScript app running in a browser), and they come with their own set of security considerations. The Authorization Code flow, with its additional steps, provides a higher level of security and is more suitable for clients that can securely store the client secret and handle server-side requests. As of OAuth 2.1, the Implicit Grant flow is no longer recommended due to security concerns.
