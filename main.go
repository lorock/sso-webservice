package main

import (
	"github.com/asofdate/sso-core"
	"github.com/asofdate/sso-jwt-auth"
)

func main() {
	sso_jwt_auth.AppRegister("hauth", sso_jwt_auth.Register)
	//sso_jwt_auth.AppRegister("ca", ca.Register)
	//hauth.AppRegister("ftp", ftp.Register)
	//sso_jwt_auth.AppRegister("common", common.Register)
	sso_jwt_auth.AppRegister("sso", sso_core.Register)

	sso_jwt_auth.Bootstrap()
}
