---
created: 2023-04-28
share: true
title: SSL/TLS证书
category: 经验
---

%%
> Never do things others can do and will do, if there are things others cannot do or will not do.
> — <cite>Amelia Earhart</cite>
%%


### how to view certificate
openssl s_client -connect 172.16.120.113:443 -servername 172.16.120.113 | openssl x509 -text -noout

#### detail
The text you've pasted contains information about the SSL certificate chain for the www.bing.com website. Each line represents a certificate in the chain, starting with the root certificate and ending with the website's certificate. Let's go through each certificate step by step:

##### Root Certificate
```
depth=2 C = IE, O = Baltimore, OU = CyberTrust, CN = Baltimore CyberTrust Root
verify return:1
```
- `depth=2`: This indicates that this is the root certificate in the chain. Depth starts at 0 for the server certificate and increases as you go up the chain.
- `C = IE`: The country where the certificate authority (CA) is based is Ireland (IE).
- `O = Baltimore`: The organization that issued the certificate is Baltimore.
- `OU = CyberTrust`: The organizational unit within the organization is CyberTrust.
- `CN = Baltimore CyberTrust Root`: The common name (CN) of the certificate is Baltimore CyberTrust Root.
- `verify return:1`: The certificate is verified, meaning the certificate is trusted.

##### Intermediate Certificate
```
depth=1 C = US, O = Microsoft Corporation, CN = Microsoft RSA TLS CA 02
verify return:1
```
- `depth=1`: This indicates that this is the intermediate certificate in the chain.
- `C = US`: The country where the CA is based is the United States (US).
- `O = Microsoft Corporation`: The organization that issued the certificate is Microsoft Corporation.
- `CN = Microsoft RSA TLS CA 02`: The common name (CN) of the certificate is Microsoft RSA TLS CA 02.
- `verify return:1`: The certificate is verified, meaning it is trusted and properly signed by the root CA.

##### Server Certificate
```
depth=0 CN = www.bing.com
verify return:1
```
- `depth=0`: This indicates that this is the server (end-entity) certificate for the website.
- `CN = www.bing.com`: The common name (CN) of the certificate is www.bing.com, which is the domain name the certificate was issued for.
- `verify return:1`: The certificate is verified, meaning it is trusted and properly signed by the intermediate CA.

The information you provided shows that the SSL certificate for www.bing.com is properly signed and trusted by the certificate chain. The chain consists of a root certificate (Baltimore CyberTrust Root), an intermediate certificate (Microsoft RSA TLS CA 02), and the server certificate for the www.bing.com domain.


The information you've pasted is the detailed content of the server (end-entity) certificate for www.bing.com. Let's go through the certificate information step by step:

##### Certificate Version and Serial Number
```
Data:
    Version: 3 (0x2)
    Serial Number:
        2d:00:32:78:72:13:fa:84:ae:53:20:17:0c:00:00:00:32:78:72
```
- `Version: 3 (0x2)`: This indicates that the certificate is using X.509 version 3, which supports extensions.
- `Serial Number: 2d:00:32:78:72:13:fa:84:ae:53:20:17:0c:00:00:00:32:78:72`: This is the unique identifier assigned to the certificate by the certificate authority (CA).

2. Signature Algorithm
```
Signature Algorithm: sha256WithRSAEncryption
```
- This indicates the certificate uses the SHA-256 hashing algorithm combined with RSA encryption for its digital signature. This combination ensures the certificate's integrity and authenticity.

##### Issuer Information
```
Issuer: C=US, O=Microsoft Corporation, CN=Microsoft RSA TLS CA 02
```
- This line shows the details of the CA that issued the certificate:
    - `C=US`: The CA is based in the United States.
    - `O=Microsoft Corporation`: The organization is Microsoft Corporation.
    - `CN=Microsoft RSA TLS CA 02`: The common name of the CA is Microsoft RSA TLS CA 02.

##### Validity Period
```
Validity
    Not Before: Feb 16 03:47:45 2023 GMT
    Not After : Aug 16 03:47:45 2023 GMT
```
- The certificate is valid from February 16, 2023, to August 16, 2023.

5. Subject Information
```
Subject: CN=www.bing.com
```
- This line shows the details of the entity the certificate was issued to:
    - `CN=www.bing.com`: The common name (CN) is the domain name the certificate is issued for, which is www.bing.com.

##### Subject Public Key Info
```
Subject Public Key Info:
    Public Key Algorithm: rsaEncryption
        Public-Key: (2048 bit)
        Modulus:
            00:a7:ca:3c:99:5a:01:63:05:01:42:4e:35:13:91:
            ...
            74:41
        Exponent: 65537 (0x10001)
```
- This section contains the public key information for the certificate:
    - `Public Key Algorithm: rsaEncryption`: The public key algorithm used is RSA.
    - `Public-Key: (2048 bit)`: The public key's size is 2048 bits, which is a commonly used key size for RSA encryption.
    - `Modulus` and `Exponent`: These are the actual values that make up the public key for RSA encryption. The modulus is a large integer, and the exponent is usually a small integer (in this case, 65537).

This certificate is used to establish a secure HTTPS connection between a client (e.g., a web browser) and the www.bing.com website. The certificate's information, such as issuer, subject, and public key, helps ensure the authenticity and integrity of the connection.

##### X509v3 extensions
`X509v3 extensions` are additional pieces of information that can be included in an X.509 version 3 certificate. These extensions provide a flexible way to add extra data to a certificate, which may be required or optional depending on the specific use case.

Extensions can be used to provide more information about the certificate, its issuer, and the subject. They can also be used to specify key usage restrictions, certificate policies, and other properties that may be important for a particular application or environment.

Some common X509v3 extensions include:

1. Basic Constraints: This extension indicates whether the certificate is a CA (Certificate Authority) certificate or an end-entity certificate. It can also specify the maximum depth of the certificate chain if the certificate is a CA certificate.

2. Key Usage: This extension defines the intended purpose of the public key contained in the certificate. For example, the key may be used for digital signatures, key encipherment, data encipherment, etc.

3. Extended Key Usage: This extension provides additional information about the specific purposes for which the certificate's public key may be used, such as server authentication, client authentication, code signing, etc.

4. Subject Alternative Name: This extension allows for specifying additional identities (such as DNS names, IP addresses, email addresses, etc.) that the certificate is valid for, in addition to the common name (CN) in the subject field.

5. Authority Key Identifier: This extension provides a way to identify the public key of the issuer that can be used to verify the signature on the certificate.

6. Subject Key Identifier: This extension provides a unique identifier for the public key of the subject, which can be used in various contexts, such as certificate revocation lists (CRLs).

7. Certificate Policies: This extension provides information about the policies under which the certificate was issued, as well as any applicable policy constraints.

8. CRL Distribution Points: This extension specifies where the certificate revocation list (CRL) for the CA that issued the certificate can be found.

These extensions, along with others, help enhance the functionality and security of X.509 certificates by providing more context and control over their usage. Certificate authorities and applications can use these extensions to enforce specific requirements and constraints on certificates, ensuring they are used correctly and securely.

##### Signature Algorithm
The `Signature Algorithm` in the context of an X.509 certificate refers to the cryptographic algorithm used to create a digital signature for the certificate. The digital signature is an essential part of the certificate, as it allows the recipient (e.g., a web browser) to verify the authenticity and integrity of the certificate.

A digital signature is created by taking a hash of the certificate's content (excluding the signature itself) and then encrypting the hash using the private key of the certificate authority (CA) that issued the certificate. The recipient can then use the CA's public key to decrypt the signature and compare the resulting hash with the hash of the certificate's content. If the hashes match, it means the certificate is authentic and hasn't been tampered with.

There are several signature algorithms available for use in certificates, including:

1. RSA-based algorithms:
   - `sha256WithRSAEncryption`: This algorithm uses SHA-256 as the hashing function and RSA as the encryption algorithm.
   - `sha384WithRSAEncryption`: This algorithm uses SHA-384 as the hashing function and RSA as the encryption algorithm.
   - `sha512WithRSAEncryption`: This algorithm uses SHA-512 as the hashing function and RSA as the encryption algorithm.

2. ECDSA-based algorithms (Elliptic Curve Digital Signature Algorithm):
   - `ecdsa-with-SHA256`: This algorithm uses SHA-256 as the hashing function and ECDSA as the encryption algorithm.
   - `ecdsa-with-SHA384`: This algorithm uses SHA-384 as the hashing function and ECDSA as the encryption algorithm.
   - `ecdsa-with-SHA512`: This algorithm uses SHA-512 as the hashing function and ECDSA as the encryption algorithm.

3. DSA-based algorithms (Digital Signature Algorithm):
   - `dsa-with-SHA256`: This algorithm uses SHA-256 as the hashing function and DSA as the encryption algorithm.

The choice of a signature algorithm for a certificate depends on the security requirements, compatibility with client software, and the desired performance. In general, modern certificates use RSA or ECDSA-based algorithms with SHA-256 or stronger hashing functions, as these provide a good balance between security and performance.