package com.bookdone.global.oauth.oidc.publickey;

import java.security.PublicKey;
import java.util.List;

public interface PublicKeyService {
    List<PublicKeyDto> fetchPublicKeysFromKakao();

    void cachePublicKeysInRedis(List<PublicKeyDto> publicKeys);

    PublicKey getPublicKeyByKid(String kid);
}
