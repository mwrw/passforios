//
//  TestPGPKeys.swift
//  passKitTests
//
//  Created by Yishi Lin on 2019/7/17.
//  Copyright © 2019 Bob Sun. All rights reserved.
//

import XCTest

@testable import passKit

struct PGPTestSet {
    fileprivate static var ALL_TEST_SETS: [String: PGPTestSet] = [:]

    let publicKey: String
    let privateKey: String
    let fingerprint: String
    let passphrase: String

    fileprivate func collect() -> Self {
        Self.ALL_TEST_SETS[fingerprint] = self
        return self
    }
}

struct MultiKeyPGPTestSet {
    let publicKeys: String
    let privateKeys: String
    let fingerprints: [String]
    let passphrases: [String]
}

let RSA2048 = PGPTestSet(
    publicKey: PGP_RSA2048_PUBLIC_KEY,
    privateKey: PGP_RSA2048_PRIVATE_KEY,
    fingerprint: "a1024dae",
    passphrase: "passforios"
).collect()

let RSA2048_SUB = PGPTestSet(
    publicKey: PGP_RSA2048_PUBLIC_KEY,
    privateKey: PGP_RSA2048_PRIVATE_SUBKEY,
    fingerprint: "a1024dae",
    passphrase: "passforios"
)

let RSA4096 = PGPTestSet(
    publicKey: PGP_RSA4096_PUBLIC_KEY,
    privateKey: PGP_RSA4096_PRIVATE_KEY,
    fingerprint: "d862027e",
    passphrase: "passforios"
).collect()

let RSA4096_SUB = PGPTestSet(
    publicKey: PGP_RSA4096_PUBLIC_KEY,
    privateKey: PGP_RSA4096_PRIVATE_SUBKEY,
    fingerprint: "d862027e",
    passphrase: "passforios"
)

let ED25519 = PGPTestSet(
    publicKey: PGP_ED25519_PUBLIC_KEY,
    privateKey: PGP_ED25519_PRIVATE_KEY,
    fingerprint: "e9444483",
    passphrase: "passforios"
).collect()

let ED25519_SUB = PGPTestSet(
    publicKey: PGP_ED25519_PUBLIC_KEY,
    privateKey: PGP_ED25519_PRIVATE_SUBKEY,
    fingerprint: "e9444483",
    passphrase: "passforios"
)

let NISTP384 = PGPTestSet(
    publicKey: PGP_NISTP384_PUBLIC_KEY,
    privateKey: PGP_NISTP384_PRIVATE_KEY,
    fingerprint: "5af3c085",
    passphrase: "soirofssap"
).collect()

let RSA2048_RSA4096 = MultiKeyPGPTestSet(
    publicKeys: PGP_RSA2048_PUBLIC_KEY | PGP_RSA4096_PUBLIC_KEY,
    privateKeys: PGP_RSA2048_PRIVATE_KEY | PGP_RSA4096_PRIVATE_KEY,
    fingerprints: ["a1024dae", "d862027e"],
    passphrases: ["passforios", "passforios"]
)

let ED25519_NISTP384 = MultiKeyPGPTestSet(
    publicKeys: PGP_ED25519_PUBLIC_KEY | PGP_NISTP384_PUBLIC_KEY,
    privateKeys: PGP_ED25519_PRIVATE_KEY | PGP_NISTP384_PRIVATE_KEY,
    fingerprints: ["e9444483", "5af3c085"],
    passphrases: ["passforios", "soirofssap"]
)

func requestPGPKeyPassphrase(keyID: String) -> String {
    let id = keyID.suffix(8).lowercased()
    return PGPTestSet.ALL_TEST_SETS[id]?.passphrase ?? "passforios"
}

let PGP_RSA2048_PUBLIC_KEY = """
-----BEGIN PGP PUBLIC KEY BLOCK-----

mQENBF0uBLkBCADGYAW5yJQ/lLHmHdb/l0bhYyLnhuyWTaOWIEHGiDnpjO71vBPD
WMPxPulj/GGdqzR4lUUanPG1yJwXTjNutjMBZ/o+ixgdqja391b4L8VyF5Lb7pHX
c6uvbR6p1Tj72PJrVj6Ev71VdnsHNOLUDqWZL4b0dNXPf3sM4ry5yS6Ej6ho9o/l
nuYbe9WfLqUctSM+TsXd84ptc6luIHZN+cojrNGAh3RLYuVFeJjkLkvHdJBWJQS2
zJ0iAA6T0NbfPGrVL6tMaB7NwMDN33Ql3ARfaHf7/d8DXGYyGUYZFqyKagGUaBxN
arXfzv9gIyc109D8pPMN5QUiEo9K4x3xNpLhABEBAAG0KnBhc3Nmb3Jpb3MgPGRl
dmVsb3BlckBwYXNzZm9yaW9zLm1zc3VuLm1lPokBTgQTAQgAOAIbAwULCQgHAgYV
CgkICwIEFgIDAQIeAQIXgBYhBEcSKGJxIg2ymYg+pwYuZ42hAk2uBQJdLgWNAAoJ
EAYuZ42hAk2uYjIH/iPsoJD+KfJ/c7GTSLbeMtQtuIv2sCiSc+BiXp+EFjbNS7oS
cEYiG/FX1zuivr3wvDGbE/oVLvdTK8tDJvCh17SZZUGeTmflgByig+1/kp5JUj2x
FOH3xXCVCnh+FWB24QHLiFpwgzGuZgCKMn45PcZB7Zmo/wJsKYb040zKltQWmzg8
rZ1vOKlMgAGgdNQOu+u+8OE6x/dedYvJZePvwND4Rva+EwS+MaEZZAn76ypEblhF
pRZsTb6+PeTY+IWRnne7xUvYRmZLXhqoHq/c0hXXz2xAGmpigd50HUQRUOYtsuBi
RxXLwFIlfPpziomMTdhnOFVDL6UVLL+jqJDPHWu5AQ0EXS4EuQEIAMwr3I+NUsY+
Iwyyz6C84z90kHPs9zOBvGc73Tgc70lXHUklwQaqLSmLbHQzk6Ykw/o1snQ8Oz2f
AjPlBr9/zWJgOvnFH+FrjpfEpmz4WjmoxBK610JINkKW4Fn4VT/NrBL9LtjaZOLp
0XA6fh8TXTOsz80jDj1VPvNAsu78FC+zXFDvOJpX+bCv3vabO9/ihKL/emvgqzxD
LO9IapPfL1rPvCmfaNZ8hRV8ebHOW0pVLfyOYn4pvwtL/uYIINv1CYAwOGVW1sth
8kS8Acj4VTDkynuobxiLDTpNrRUbt0iPn/2nJ8m1qq9hqWgO2z01UkSKrusDiMNH
TnHFepgG8NMAEQEAAYkBPAQYAQgAJhYhBEcSKGJxIg2ymYg+pwYuZ42hAk2uBQJd
LgS5AhsMBQkDwmcAAAoJEAYuZ42hAk2u+rkIAKEwherMhNV+kZpZMoYLop9ULTNx
RQtBhNK5No7MpGzJnGbJzXo2+CaB7wlOzzDympIVxth+St7S4BiSdMxrnQVzzZOf
Lfvc6+AyWBwpM32i/s5piTCwn+RoQzYHQpiRBmeGRBXC2tTkAh+zXhed7yZR5mMK
lsVq9BRfVFxbkh9S1YWLUC29n32eiAo/6nLyJw/AOlv37ThYPnIeSqrASs0Jh69C
iNbGUq2SzH1yj1cxWvhZqXA8WpbU/pZM6LR6eIeLOa+BTp0Ax6j2QQ3N3bKEcOTz
ncsjMsi8gUJaucHKKRcGXY0AlWAbvH1ytWboh+CgS493JfZbNRCXTWA/BDE=
=2FVp
-----END PGP PUBLIC KEY BLOCK-----
"""

let PGP_RSA2048_PRIVATE_KEY = """
-----BEGIN PGP PRIVATE KEY BLOCK-----

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
=qgCJ
-----END PGP PRIVATE KEY BLOCK-----
"""

let PGP_RSA2048_PRIVATE_SUBKEY = """
-----BEGIN PGP PRIVATE KEY BLOCK-----

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
XY0AlWAbvH1ytWboh+CgS493JfZbNRCXTWA/BDE=
=qBfw
-----END PGP PRIVATE KEY BLOCK-----
"""

let PGP_RSA4096_PUBLIC_KEY = """
-----BEGIN PGP PUBLIC KEY BLOCK-----

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
ERIDrUdG
=N0dj
-----END PGP PUBLIC KEY BLOCK-----
"""

let PGP_RSA4096_PRIVATE_KEY = """
-----BEGIN PGP PRIVATE KEY BLOCK-----

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
=Ql28
-----END PGP PRIVATE KEY BLOCK-----
"""

let PGP_RSA4096_PRIVATE_SUBKEY = """
-----BEGIN PGP PRIVATE KEY BLOCK-----

lQIVBF6SL3wBEACw85Gzn3qbldFHEfAD8W0jYTOMJ8D4Fy0Q3o/FYMU50Qllaiwa
vGRRbpgTEE2U0/uhlqPIHICUNBAzCHPxvgSD/suv0sMqeccdumgJ+V5wfF4AaO85
vTrYujOragKjhf+ZOvO8IlvpFBm9XXOF0wll1yicKVkdflq7GSMN9FC+VCDL/V9k
mN9m9L4VfYhRC9gPd7e7338E+CuPDs+B58uWwmtxB1Gtziv+8PdTPhQCFQlcz4p0
HTnxr+87H/6RPfyOXjquZnNuItigAvYkhiBIVIVrimxxdf1NcosM1A1Z+Q2+LNZ5
6a9FWdyZfyPb6HT4inqqSsGx/7xaf4ebOFTiAOs+YChKkgztkGkDSnmc0yfTtYJ2
bT+in8C0WL/IODlrZKqQ8UmJRSzl1r2I+BvgqtzEhYHE/WluWGjbLEQBQ6zr9fng
rR5FFsY9ej91y1WIDu9cE2c/mGyMMrezw89fmFc7JlmoLmxNe7b0c3qPRu5kn2jb
7Y2Ra7P4OvLpKBcGvMXLhkTPP83962cx9649bB7oTzfyaFCYgSKKKgLAPBjxGl5a
q3sX4MEI/927sJULgJdZnXKo6J35Ik0ZXk/ttqPOy0O5YXCciAzoOHjds3DJQjsa
opcpbbJS1L7MG73JQvzsxCuymbRaAslyd8Op1IUFBrDP9mfNtJDW230SxwARAQAB
/wBlAEdOVQG0KnBhc3Nmb3Jpb3MgPGRldmVsb3BlckBwYXNzZm9yaW9zLm1zc3Vu
Lm1lPokCTgQTAQgAOBYhBHh+rhpfo+dJqjTMaqBkXr7YYgJ+BQJeki98AhsDBQsJ
CAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEKBkXr7YYgJ+P94P/2vn/WM6ekhqOso9
Z2SMqf46Y7taq+TEoBxSjkLIT6al9cS4I3UxeRZ9X6jE1WW/im+sSJ67bUunGbd5
O2e9I+c+ora4LG21ZLltiKh9BkcXNGy6oEy6h7Hc42ga8G9rHUe8/jNIr84IYtOz
2qiEDjY/lYkRpfiCWiukzhGLoT/DDtCdG2v0760znKTifB9A39aR1tCGg2A2l1K0
jRMxFSSNw0wgktyXxX9rHvQHD7kpvuqis78BQ4wYzlbw69aam22jkvtyKvc7GQBM
z/Ll/y0XMzTWYhDI63PRbd8onXVTCgGzIyVjg1kxnddqb8dZdKtwegLo6vEWRHFY
ocgakibsQmJX6S0w6JqpWndesadpgjTbU1n+QkI8dHEKMY+G39rJGFaInswLuTuj
DjzBE8k6/7QH+n7MnJvQG9bR2BWv0iLpMZeh7JriM8dq9fNkENLtsbh1aAar38ui
iLAWjFZbfpvbLkM2AKiBRiyFBxlL482UMTAhGnHcAtE1iGYITB3ouUDXI57Qf8Eo
ymJmQpCVHF8eJfDp7Ye2C08X3dUle5KjGqDzAa5kT9W4yM2OA1EV4bM4Dl5BiyXN
ecAMgWd+Z86H7JEtblV4vPIbERrkXbRKbdO5Z0LkoeIU6ql8918z1/3XvTtvkkEr
ntPtxbw9nJiiYA99+lwWOEushuVYnQdGBF6SL3wBEACvRrGqjzyhmc9DIPnth4za
CeB60En8qjJlvy4jko33BOv9eSgEbl4OD7IuXEjuaT4AX97mz8GNO4CsgcKHJGZW
U561T5E6SCVCD5nWrcKusKLhCZHwTIeP2a7t+u0SFsP0jQS08f33Vfkx4nTP6KFO
z0ea04Zpuy7bi81gQ88+Jmgwu4M3lXRGpH5bs9wLkKBxpAyTHTltz17JxJSGLGUk
vUa81cyVpwBp/pjWFgSx/n2TKgW1S14rh+Ng85OARtxm17Gt6NWLERS1d+O7Q95L
iXzx5cH+Mtd8GD/J730lKiNaWyDCdTEuEg6j/AK7VcJzj5ZpgyQIfuDyCi0olYwY
pgMgKTRltuascWTkmnAoyksJ8ybbz5SyGSxSGXTjIncF4Gj52cYzsMRMncUG1RX9
ZpmaSsfEhDRKBeFDPqJWeJpyjvZFtEb78qPld2iY1Uu9bln0VamV7HdE4ELwwa/d
MjKgGWKp0Qcw2mmoBeQX+T5DttlKuJTnTCeymzZ79N3rKIRTgx1waK9uZ8AbY8sZ
Z5ZymHfBZAV08UFnkJzHyMYJu/HU9Lipk0ZqwA/ixN5gRCxXg6Y90GB4j50F0c/n
dDBA3iVCTBt8qSYL2yGNqllnlW+O02ZGIxgEmDw70qSfAja93egAiTI6SrADlN2e
9eaLIAjzQ1wtNkK+lVQrGwARAQAB/gcDAhGB8S4eigSg54IkDELKmoxO2GXp0V4T
tGx2PKiq3/r5zq5Lc7zIZYVyRb7aSOBtDzPLKehDy5OfkgmWycvr9+BjIoyk4am1
GjxHTHA0MLpJ8QRp/PRcR2kvFOK45IZg5/fiRIRIqyF/esNd4uXhZbdD2yHl9UvU
ABt0k7tNZHu0BIh65m/auSblvmWHln6seFZyRglXOkWLKIZID25P8yaYy/THF6zr
8vgX4HHAnWokTs5e2XDYi6a2QdyKIB2x5zw2evH7VejyBPpYLqzVjr43N/wYfPF5
QQmghrPFu7eDSbdBFS8E18j9FjBQN99kde18PP0V9T+bK4fEqHUxLPLLW9ZFaVwI
gOHke3hFTy6udBHOk4vmlJdpyCVTRKuaK/8OkjG7dAiFnqJFq28xQ8ab+x93fFZo
xUmXXzYYm7xmRDEsWqkBF1f6NjaEGF3NZMDit4iVS4KrqNgObaHOgQTX2FqB5btA
Gq51N9SSdBJbX3WQE+2/wsG6dSggJmfQa9lVD3a2+PuhXDTzREh8jBlOzS1vOvV4
zmrhZTz5wF5N7lqym/mxxmMUP1X6eQAKdeQ/+qus7HIaN+MjonV3cQuK5I3t3/gu
j28dF1RdCND2mjut6TXnQvp5dDWv4fY7XG4j+KqdrrxDWaosB2ABCtszxTyoV/F8
fjnYL9l4XM5MU0GJJQkBCj8SFSvb08aqPIbDHGoXygCT0ZTRZnZjKHwABdGl9gSb
qSNeYntHrtCyhUu3dXnsWUbNvDVe9cKXM5w7HJhb3IIxbNf7sz31UjsTRbL8IbVI
oJH8AEgaud39TmPYqanFMeDXTKoaoI+qi3ZYbYBZO7EKjqrkN/SipPVdXqozKTAd
/NqYt6yf8iCDd3YqjYYL5MJYfg79h99B70RE1Cf/RZq97xf6jAY4JqMTVPmgog9v
9iXOn4rw5iX5QmLErtGpuKVk2ay4wrZoUj7raz51hB1U4NX73mYxisjmnz6JcZzz
ei3bA+k1MEcjow1pgJ4d//tVyR35q5YbEhH2GtAdEyCjRux9z27Wstp2y3CiA2sF
wHQQRwiQ2IkFPH9rV3TrVxQ99H80/jpx1ggd4Wbazc1h5ugw32vE0PXVpfjWoacp
9dl2MRTdTKam++239dsjvmFRY5BlWrQMia0/mGJZz5Btr4uhbcJ8jr9RUoYDkvgZ
3hCOOKW174tocb4jrX6gmugjZH89pqIFBJOE8yRZYjIoIbrSc7BeRhBDFbAuDons
19A8Ig3kzdy3JtFybNFoiRTiv2VC3YC96yjAxgUEZtN4FG7gVuabnbdngOSdIXWe
nbtPA/lNsLCSEYPJ1ohsJwiSs81xsCtEcOp/6aAmLkz7Zoih28xIcQknywcAvt+8
Hcjl81kTl7PIUN6EoMFYlVV0EUnibg4R9JG/oug3SF/iAOYVty3QJN9XRW88LHO6
3c02kl37JLTCNc487I4l+GySV1+hPNdQZ9m/8CbbWphUmHRp8nDJZwF0N0Z3hk6V
ObtTGZ1Bk9snmJm5IB3N4SOPIhtXjVC9r0ZXluA8vlGT3B7m5sAAoTDtpvzSMyiz
3aLbLE5gyyhrYaOApJNfpS30f2L2FbX/vQuxptdpIhYg6eIOkbMpWOJ9JGGWqx2n
7sEF6GqmRTUxxQX23pLrkEEKUYG/h3fiCSleuzFKDsBGd5PJoNbFO0OQUHDzv0kR
mIJFjG3I1wCJZHAnNN9+sXB4kX1O19W1F3EBpWfNwP41tdXcJiUTUgY1y69utcJU
N32fe5xMJQ7K23DoH2eJAjYEGAEIACAWIQR4fq4aX6PnSao0zGqgZF6+2GICfgUC
XpIvfAIbDAAKCRCgZF6+2GICfv68D/0ettf8g0c/STL/l0rr0GslmW/dhhaYkLTn
1hvh5/Sr5wzvqXX0jhna0qoINndSPr0AfatY4oF97fKaNNqlre4fe2kywC5wGoRs
c7qV12GxSAkBrDVmuml/M+XQwkMskLq7waUe+Hjr1+6axK8YB0s2ltNCi203jHbF
7aetnhVCt94V3VP9GAo/E8kteOGr7nKps0T8UoivfliJdOU52o0OKHcYHjEmCv9z
Y7hJ8rcX0DaLAmnl6WXXPeHLaagDQBPeSAcbTbfudXrnTmyIwSfuu3v0IMDEcKCO
yhywpmXHaR8Vspf2yx4K4wRzOj3snzrZN/hZT1Dsoz5Zk2bGBZJwPTnmQhzTqtQO
QbJqESsMNHcoW+SULplY0F/rp5+ifW9ezbDVfBRTtE6HOA0NiR6EthSzUeJrnSrV
r6b4csDpYSRpCaPQCJYXqeQCvGlsIFwVPx4FYxF4ydGbDaL4pGUXh8byFcFNHX+N
T1LTfI1WgdQW5m4FMj2ob4QWrAo/xV5luB+0VI3Il+OzDBIbjLIgRarID9Og3MEm
fzfCKE3JHxovajN+0FDn9l3JvBitbRnMnwbyQGhXF93nEczAz1B9CYqZca1+uvDi
wtlehc82JEhnqolVt9yXVFOhGxQwNgv9665cH9/3W6STnUiM7V9RkG93OALOLxdT
ghESA61HRg==
=DFUr
-----END PGP PRIVATE KEY BLOCK-----
"""

let PGP_ED25519_PUBLIC_KEY = """
-----BEGIN PGP PUBLIC KEY BLOCK-----

mDMEXS4TMRYJKwYBBAHaRw8BAQdAW/U3l3/bMWFxHaCQ3Kr8Wel5322hgiVGO39K
mk+NLYO0KnBhc3Nmb3Jpb3MgPGRldmVsb3BlckBwYXNzZm9yaW9zLm1zc3VuLm1l
PoiQBBMWCAA4FiEEX8ywgauK9IlymZ4q51Csv+lERIMFAl0uEzECGwMFCwkIBwIG
FQoJCAsCBBYCAwECHgECF4AACgkQ51Csv+lERIM0RgEAtw6VI0hbhIiSCZuHfePn
3XmXQnSkfYw6OrND86vNPEgBAIcymV45aM3IUMi7cczlNemdc4vzvZ2sahN4I9bp
zygDuDgEXS4TMRIKKwYBBAGXVQEFAQEHQDEc6qSqOJHTY/QBMBCuH2NPbc3jfJKe
3zN15IWfji9hAwEIB4h4BBgWCAAgFiEEX8ywgauK9IlymZ4q51Csv+lERIMFAl0u
EzECGwwACgkQ51Csv+lERIMOsAEA43pkVP9br/TmESz/IuTZBfVAexAA3Q9DRL7M
NcZVu2wA/js8TfomM2QBmZYPSZFPzA1nI1FzzgPhFgy6fGLgpZUL
=4EF6
-----END PGP PUBLIC KEY BLOCK-----
"""

let PGP_ED25519_PRIVATE_KEY = """
-----BEGIN PGP PRIVATE KEY BLOCK-----

lIYEXS4TMRYJKwYBBAHaRw8BAQdAW/U3l3/bMWFxHaCQ3Kr8Wel5322hgiVGO39K
mk+NLYP+BwMCw1EywRMGVRHmRf963xPpOVBluE38pFvriDQXbceoPZVdgyr+M2Ef
3HFn8t/ZyTzeZQZIgmlAFNgiDaz3I+CISN89uVFt7yJVGzbuvjgVSrQqcGFzc2Zv
cmlvcyA8ZGV2ZWxvcGVyQHBhc3Nmb3Jpb3MubXNzdW4ubWU+iJAEExYIADgWIQRf
zLCBq4r0iXKZnirnUKy/6UREgwUCXS4TMQIbAwULCQgHAgYVCgkICwIEFgIDAQIe
AQIXgAAKCRDnUKy/6UREgzRGAQC3DpUjSFuEiJIJm4d94+fdeZdCdKR9jDo6s0Pz
q808SAEAhzKZXjlozchQyLtxzOU16Z1zi/O9naxqE3gj1unPKAOciwRdLhMxEgor
BgEEAZdVAQUBAQdAMRzqpKo4kdNj9AEwEK4fY09tzeN8kp7fM3XkhZ+OL2EDAQgH
/gcDAsJwqoLIpKyw5lJwU83TfgSJJLrBR6KGLB1oZigRAasw++69iC19yUS6FY3M
mRiOrYeBatYCoXY8xolbStkhZl2y9KYlPcFNWOQvVKtuUT2IeAQYFggAIBYhBF/M
sIGrivSJcpmeKudQrL/pRESDBQJdLhMxAhsMAAoJEOdQrL/pRESDDrABAON6ZFT/
W6/05hEs/yLk2QX1QHsQAN0PQ0S+zDXGVbtsAP47PE36JjNkAZmWD0mRT8wNZyNR
c84D4RYMunxi4KWVCw==
=nV4i
-----END PGP PRIVATE KEY BLOCK-----
"""

let PGP_ED25519_PRIVATE_SUBKEY = """
-----BEGIN PGP PRIVATE KEY BLOCK-----

lDsEXS4TMRYJKwYBBAHaRw8BAQdAW/U3l3/bMWFxHaCQ3Kr8Wel5322hgiVGO39K
mk+NLYP/AGUAR05VAbQqcGFzc2ZvcmlvcyA8ZGV2ZWxvcGVyQHBhc3Nmb3Jpb3Mu
bXNzdW4ubWU+iJAEExYIADgWIQRfzLCBq4r0iXKZnirnUKy/6UREgwUCXS4TMQIb
AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRDnUKy/6UREgzRGAQC3DpUjSFuE
iJIJm4d94+fdeZdCdKR9jDo6s0Pzq808SAEAhzKZXjlozchQyLtxzOU16Z1zi/O9
naxqE3gj1unPKAOciwRdLhMxEgorBgEEAZdVAQUBAQdAMRzqpKo4kdNj9AEwEK4f
Y09tzeN8kp7fM3XkhZ+OL2EDAQgH/gcDAk55ulCfKROW5kyrg18FeoHR+DNPhKVV
7R2CyAinW5c4+SiLk+P4Zbgue1JEmCNqhckywVx6LOFoR3OdJRFumfuacB82QUY+
p9VjMutDAO+IeAQYFggAIBYhBF/MsIGrivSJcpmeKudQrL/pRESDBQJdLhMxAhsM
AAoJEOdQrL/pRESDDrABAON6ZFT/W6/05hEs/yLk2QX1QHsQAN0PQ0S+zDXGVbts
AP47PE36JjNkAZmWD0mRT8wNZyNRc84D4RYMunxi4KWVCw==
=4Sfz
-----END PGP PRIVATE KEY BLOCK-----
"""

let PGP_NISTP384_PUBLIC_KEY = """
-----BEGIN PGP PUBLIC KEY BLOCK-----

mG8EXpUo3hMFK4EEACIDAwQXzJVx15CZgw9lpJPlFaAaFIJtxc4RevL8LitUdRZF
nVmPpYpgZwoROtSEb+JPKrYR9xVFTOzf+BYXWTyq4YXFfxQrea2hRx7RZUMj3tex
A+tOTnA0ruqCzMIsLYGglcK0KnBhc3Nmb3Jpb3MgPGRldmVsb3BlckBwYXNzZm9y
aW9zLm1zc3VuLm1lPoiwBBMTCQA4FiEEvNNkwHhYXAYH4ZxnFxwH0lrzwIUFAl6V
KN4CGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQFxwH0lrzwIV2FQF/X3sS
rP8f20TOpqI4Ng/5Du6QKcdje05VWVDpBVnT/f40aT8jQi6ykqrHLsWek2yFAYDn
3UD8FchlUlSbvVofgipPkPp+nSsm92D+e1r4XtHT+u+8eYtMbf8iVB8qX0B3ufC4
cwRelSjeEgUrgQQAIgMDBC8+ymFhSwUs95FmaFe52FruXlFsRgwcOfsu2MI1oMh4
xjX0uh+lwzIndDM7zbrRjkVdUijydV47TebANUwJ9S9uroOj9yxAHpg7CVRI0Kcb
NhoF3eBfNDYe5YydQvJqGgMBCQmImAQYEwkAIBYhBLzTZMB4WFwGB+GcZxccB9Ja
88CFBQJelSjeAhsMAAoJEBccB9Ja88CFqwsBgKrjm2MeRnIYpSdzWEfuW9QCvaD5
bklFOfAbrdBTp39u/3iO+maLmA7/AgFFcO+AAgF/Vb/tUBdvu/pn/viWagGzK/pk
cacCQ5/PGk4Ln2CosOS1atZpkmX5JJLr034tKMr6
=TMCI
-----END PGP PUBLIC KEY BLOCK-----
"""

let PGP_NISTP384_PRIVATE_KEY = """
-----BEGIN PGP PRIVATE KEY BLOCK-----

lNIEXpUo3hMFK4EEACIDAwQXzJVx15CZgw9lpJPlFaAaFIJtxc4RevL8LitUdRZF
nVmPpYpgZwoROtSEb+JPKrYR9xVFTOzf+BYXWTyq4YXFfxQrea2hRx7RZUMj3tex
A+tOTnA0ruqCzMIsLYGglcL+BwMCgmXDbtpRcF//w9wVoIqLBqlBfcfbPN35l+eo
pTLlOEQq8ioYjXotSysjocxyW1urNKq3g5Np0ZEU8iXtD0LGdtOWq7a9UnI+90vc
gq1UVxYhIWdtH5Tssshrfi6E26y0KnBhc3Nmb3Jpb3MgPGRldmVsb3BlckBwYXNz
Zm9yaW9zLm1zc3VuLm1lPoiwBBMTCQA4FiEEvNNkwHhYXAYH4ZxnFxwH0lrzwIUF
Al6VKN4CGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQFxwH0lrzwIV2FQF/
X3sSrP8f20TOpqI4Ng/5Du6QKcdje05VWVDpBVnT/f40aT8jQi6ykqrHLsWek2yF
AYDn3UD8FchlUlSbvVofgipPkPp+nSsm92D+e1r4XtHT+u+8eYtMbf8iVB8qX0B3
ufCc1gRelSjeEgUrgQQAIgMDBC8+ymFhSwUs95FmaFe52FruXlFsRgwcOfsu2MI1
oMh4xjX0uh+lwzIndDM7zbrRjkVdUijydV47TebANUwJ9S9uroOj9yxAHpg7CVRI
0KcbNhoF3eBfNDYe5YydQvJqGgMBCQn+BwMC3cQgKP9rMPr/RlmS+ANayfPVjNUs
bq/6y9YWmUTN7kppKTMU6VYYMxHNSX1GIZ7RWrsWr0h5DQRrWaSef9tsyGMl0cl5
scuDku5Yzmt4meoaqZJaRLaP4EuypaGGpKOImAQYEwkAIBYhBLzTZMB4WFwGB+Gc
ZxccB9Ja88CFBQJelSjeAhsMAAoJEBccB9Ja88CFqwsBgKrjm2MeRnIYpSdzWEfu
W9QCvaD5bklFOfAbrdBTp39u/3iO+maLmA7/AgFFcO+AAgF/Vb/tUBdvu/pn/viW
agGzK/pkcacCQ5/PGk4Ln2CosOS1atZpkmX5JJLr034tKMr6
=vn6S
-----END PGP PRIVATE KEY BLOCK-----
"""
