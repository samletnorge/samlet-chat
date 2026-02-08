package main

import (
	"io/ioutil"
	"os"
	"testing"
)

func TestConfigFileLoadBasics(t *testing.T) {
	failTestOnError(t, setupTestEnv())

	f, err := ioutil.TempFile("", "samlet-chat")
	if err != nil {
		t.Errorf("error creating temporary file: %v", err)
		return
	}

	defer func() {
		if err := f.Close(); err != nil {
			t.Errorf("error closing temporary file: %v", err)
			return
		}

		if err := os.Remove(f.Name()); err != nil {
			t.Errorf("error removing temporary file: %v", err)
			return
		}
	}()

	contents := `
		# samlet-chat port
		SAMLETCHAT_PORT=8000
		SAMLETCHAT_GZIP_STATIC=true
	`
	if _, err := f.Write([]byte(contents)); err != nil {
		t.Errorf("error writing to temporary file: %v", err)
		return
	}

	os.Setenv("SAMLETCHAT_PORT", "9000")
	if err := configFileLoad(f.Name()); err != nil {
		t.Errorf("unexpected error loading config file: %v", err)
		return
	}

	if os.Getenv("SAMLETCHAT_PORT") != "9000" {
		t.Errorf("expected SAMLETCHAT_PORT=9000 got SAMLETCHAT_PORT=%s", os.Getenv("SAMLETCHAT_PORT"))
		return
	}

	if os.Getenv("SAMLETCHAT_GZIP_STATIC") != "true" {
		t.Errorf("expected SAMLETCHAT_GZIP_STATIC=true got SAMLETCHAT_GZIP_STATIC=%s", os.Getenv("SAMLETCHAT_GZIP_STATIC"))
		return
	}
}

func TestConfigFileLoadInvalid(t *testing.T) {
	failTestOnError(t, setupTestEnv())

	f, err := ioutil.TempFile("", "samlet-chat")
	if err != nil {
		t.Errorf("error creating temporary file: %v", err)
		return
	}

	defer func() {
		if err := f.Close(); err != nil {
			t.Errorf("error closing temporary file: %v", err)
			return
		}

		if err := os.Remove(f.Name()); err != nil {
			t.Errorf("error removing temporary file: %v", err)
			return
		}
	}()

	contents := `
		SAMLETCHAT_PORT=8000
		INVALID_LINE
	`
	if _, err := f.Write([]byte(contents)); err != nil {
		t.Errorf("error writing to temporary file: %v", err)
		return
	}

	if err := configFileLoad(f.Name()); err != errorInvalidConfigFile {
		t.Errorf("expected err=%v got err=%v", errorInvalidConfigFile, err)
		return
	}
}
